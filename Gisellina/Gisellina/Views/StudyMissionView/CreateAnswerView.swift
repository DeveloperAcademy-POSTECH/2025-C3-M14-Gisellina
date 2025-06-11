import SwiftUI
import Foundation
import Supabase

struct CreateAnswerView: View {

    @State private var content: String = "" // 사용자가 입력할 답변 내용
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var isTextEditorFocused: Bool

    @State private var isLoading: Bool = false
    @State private var statusMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isSubmitted: Bool = false

    // 미션 ID - 직접 설정하거나 다른 방식으로 받아올 수 있습니다
    @State private var currentMissionID: UUID?
    @EnvironmentObject var router: Router

    //MARK: - Safe Area Top을 설정합니다.
    var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 20 // 기본값 20 (예: iPhone SE)
    }

    //MARK: - View Start
    var body: some View {
        ZStack {
            Image("StudyMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)

        ZStack {
            Image("StudyMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)

            VStack(spacing: 12){

                //MARK: - Top Navigation Menu Bar(look like Noah View)
                CustomNavigationBar(
                    title: "사건 검토하기",
                    titleColor: .white,
                    leftItem: AnyView(
                        NavigationIconButton(
                            action: { router.pop() },
                            iconName: "chevron.left",
                            iconColor: .white
                        )
                    )
                )

                VStack{
                    Image("MissionCharacter")
                        .resizable()
                        .frame(width: 168, height: 168)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity)

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))

                    // Placeholder
                    if content.isEmpty {
                        Text("관련 법령, 판례, 논리를 바탕으로 사건을 검토해주세요.")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(12)
                    }

                    TextEditor(text: $content)
                        .font(.caption)
                        .padding(8)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .focused($isTextEditorFocused)
                }
                .frame(height: 300)

                Button {
                    Task {
                        await submitAnswer()
                    }
                } label: {
                    if isLoading {
                        HStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                            Text("제출 중...")
                                .foregroundStyle(.white)
                        }
                    } else {
                        StudyButton(studyButtonTitle: "제출하기", studyButtonColor: Color("StudyButton"), studyButtonHeight: 52)
                    }
                }
               
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(isLoading || !isFormValid())

                // 새로운 방식 (iOS 16+)
                .navigationDestination(isPresented: $isSubmitted) {
                    StudyMissionCompleteView(currentMissionID: currentMissionID ?? UUID())
                }
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        }
        .onAppear {
            // 필요시 미션 ID를 설정하는 로직을 여기에 추가
            // 예: currentMissionID = UUID() // 임시로 새 UUID 생성
            getCurrentMissionID()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("알림"), message: Text(statusMessage), dismissButton: .default(Text("확인")))
        }
        .navigationBarBackButtonHidden(true)
    }

    // 현재 미션 ID 가져오기 - Supabase에서 데이터 확인
    private func getCurrentMissionID() {
        Task {
            await fetchMissionFromSupabase()
        }
    }
    
    @MainActor
    private func fetchMissionFromSupabase() async {
        // print("🔍 Supabase에서 미션 데이터 확인 시작")
        
        do {
            // 1. 먼저 테이블에 어떤 데이터가 있는지 확인
            let response = try await SupabaseManager.shared.client
                .from("map_user_mission_detail")
                .select("*")
                .limit(5) // 최대 5개만 가져와서 확인
                .execute()
            
            // print("📊 Supabase 응답 데이터:")
            // if let jsonString = String(data: response.data, encoding: .utf8) {
            //     print(jsonString)
            // } else {
            //     print("❌ 응답 데이터를 문자열로 변환할 수 없음")
            // }
            
            // 2. JSON을 Dictionary 배열로 파싱해서 확인
            if let jsonArray = try JSONSerialization.jsonObject(with: response.data) as? [[String: Any]] {
                // print("📝 파싱된 데이터 개수: \(jsonArray.count)")
                
                // for (index, item) in jsonArray.enumerated() {
                //     print("--- 항목 \(index + 1) ---")
                //     for (key, value) in item {
                //         print("\(key): \(value)")
                //     }
                // }
                
                // 3. 첫 번째 항목에서 ID 찾기
                if let firstItem = jsonArray.first {
                    // 가능한 ID 필드명들을 확인
                    let possibleIdKeys = ["id", "user_detail_id", "mission_id", "detail_id"]
                    
                    for key in possibleIdKeys {
                        if let idValue = firstItem[key] {
                            // print("🎯 찾은 ID 필드: \(key) = \(idValue)")
                            
                            // UUID로 변환 시도
                            if let idString = idValue as? String, let uuid = UUID(uuidString: idString) {
                                currentMissionID = uuid
                                print("✅ 미션 ID 설정 성공: \(uuid)")
                                return
                            }
                        }
                    }
                    
                    // print("⚠️ UUID 필드를 찾을 수 없음. 사용 가능한 필드:")
                    // for key in firstItem.keys {
                    //     print("- \(key)")
                    // }
                }
            }
            
        } catch {
            print("❌ Supabase 데이터 가져오기 실패: \(error)")
            statusMessage = "데이터를 가져올 수 없습니다: \(error.localizedDescription)"
            showAlert = true
        }
    }

    // 유효성 검사
    private func isFormValid() -> Bool {
        !content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    // 초기화
    private func resetForm() {
        content = ""
        statusMessage = ""
        showAlert = false
    }

    // 답변 제출
    @MainActor
    private func submitAnswer() async {
        // print("🚀 답변 제출 시작")

        guard let currentDetailID: UUID = currentMissionID else {
            statusMessage = "미션 ID가 설정되지 않았습니다."
            showAlert = true
            return
        }

        // print("🧩 currentDetailID: \(currentDetailID)")
        // print("📝 입력된 답변: \(content)")

        guard isFormValid() else {
            statusMessage = "답변 내용을 입력해주세요."
            showAlert = true
            return
        }

        isLoading = true

        do {
            let updateData: [String: AnyJSON] = [
                "answer": AnyJSON.string(content.trimmingCharacters(in: .whitespacesAndNewlines)),
                "earned_exp": AnyJSON(10),
                "is_done": AnyJSON.bool(true)
            ]

            // print("📦 업데이트할 데이터: \(updateData)")

            let response = try await SupabaseManager.shared.client
                .from("map_user_mission_detail")
                .update(updateData)
                .eq("user_detail_id", value: currentDetailID)
                .execute()

            print("✅ 업데이트 성공: \(String(data: response.data, encoding: .utf8) ?? "데이터 없음")")

            statusMessage = "답변이 성공적으로 제출되었습니다!"
            showAlert = false
            isSubmitted = true
            resetForm()

        } catch {
            print("❌ 제출 실패: \(error)")
            statusMessage = "답변 제출 실패: \(error.localizedDescription)"
            showAlert = true
        }

        isLoading = false
    }
}
