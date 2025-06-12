import SwiftUI
import Foundation
import Supabase
import Combine


struct CreateAnswerView: View {
    
    @State private var content: String = "" // 사용자가 입력할 답변 내용
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var isTextEditorFocused: Bool
    
    @State private var isLoading: Bool = false
    @State private var statusMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isSubmitted: Bool = false
    
    @EnvironmentObject var router: Router
    let mission: StudyMissionDetail
 
    
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
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(12)
                                .allowsHitTesting(false)
                        }
                        
                        TextEditor(text: $content)
                            .font(.body)
                            .padding(5)
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
                    .disabled(isLoading || !isFormValid())
                    
                    
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color.clear.contentShape(Rectangle()) // 키보드 외부 터치 시 내리기
                    .onTapGesture {
                        isTextEditorFocused = false
                    }
                )

            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("알림"), message: Text(statusMessage), dismissButton: .default(Text("확인")))
        }
        .navigationBarBackButtonHidden(true)
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
        
        let currentDetailID = mission.id
        
        guard isFormValid() else {
            statusMessage = "답변 내용을 입력해주세요."
            showAlert = true
            return
        }
        
        isLoading = true
        
        do {
            let client = SupabaseManager.shared.client
            let trimmedContent = content.trimmingCharacters(in: .whitespacesAndNewlines)
            let userID = UserService.currentUserID()
            
            // Step 1. 답변 저장
            try await client
                .from("map_user_mission_detail")
                .update([
                    "answer": AnyJSON.string(trimmedContent),
                    "is_done": true
                ])
                .eq("user_detail_id", value: currentDetailID.uuidString)
                .execute()
            
            
            print("📝 답변 저장 완료")
            
            // Step 2. RPC 호출 (confirm_mission)
            try await client.rpc("confirm_mission", params: [
                "p_user_id": userID,
                "p_detail_id": currentDetailID.uuidString
            ])
            .execute()
            
            print("✅ RPC confirm_mission 성공")
            
            router.push(.studyMissionComplete(mission: mission, userAnswer: content))
            
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

