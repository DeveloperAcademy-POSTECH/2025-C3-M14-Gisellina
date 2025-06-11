import SwiftUI
import Foundation
import Supabase

struct FormTextPostView: View {
    // 폼 데이터 상태
    @State private var content: String = "" // 사용자가 입력할 답변 내용

    // 미션 상태
    @State private var todayStudyMission: StudyMissionDetail?

    // UI 상태
    @State private var isLoading: Bool = false
    @State private var statusMessage: String = ""
    @State private var showAlert: Bool = false

    // 외부에서 주입받아야 할 값들
    let currentUserID: UUID

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // ✅ 오늘의 미션 표시
                if let mission = todayStudyMission {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("📝 오늘의 미션 내용:")
                            .font(.headline)
                        Text(mission.body)
                            .padding(8)
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }

                // 폼 헤더
                VStack(alignment: .leading, spacing: 8) {
                    Text("미션 답변 제출")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("여기에 미션에 대한 답변을 작성하고 제출해주세요.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                // 답변 입력
                VStack(alignment: .leading, spacing: 4) {
                    Text("답변 내용 *")
                        .font(.headline)

                    TextEditor(text: $content)
                        .frame(minHeight: 150)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                }
                .padding(.horizontal)

                // 제출 버튼
                Button(action: {
                    Task {
                        await submitAnswer()
                    }
                }) {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                        Text(isLoading ? "전송 중..." : "답변 제출")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid() ? Color.blue : Color.gray)
                    .cornerRadius(10)
                }
                .disabled(!isFormValid() || isLoading)
                .padding(.horizontal)

                // 초기화 버튼
                Button(action: resetForm) {
                    Text("초기화")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .disabled(isLoading)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 20)
            .navigationBarHidden(true)
        }
        .alert("알림", isPresented: $showAlert) {
            Button("확인", role: .cancel) { }
        } message: {
            Text(statusMessage)
        }
        .onAppear {
            Task {
                do {
                    let mission = try await MissionService.fetchOneStudyMission()
                    print("🎯 오늘의 미션 로딩 성공: \(mission)")
                    self.todayStudyMission = mission
                } catch {
                    print("⚠️ 미션 로딩 실패: \(error.localizedDescription)")
                }
            }
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
        guard let currentDetailID: UUID = todayStudyMission?.id else {
            statusMessage = "미션 정보가 없습니다."
            showAlert = true
            return
        }

        
        guard isFormValid() else {
            statusMessage = "답변 내용을 입력해주세요."
            showAlert = true
            return
        }

        isLoading = true
        print("🚀 답변 제출 시작")

        do {
            let updateData: [String: AnyJSON] = [
                "answer": AnyJSON.string(content.trimmingCharacters(in: .whitespacesAndNewlines)),
                "earned_exp": AnyJSON(10),
                "is_done": AnyJSON.bool(true)
            ]

            let response = try await SupabaseManager.shared.client
                .from("map_user_mission_detail")
                .update(updateData)
                .eq("user_detail_id", value: currentDetailID)
                .execute()

            print("✅ 업데이트 성공: \(String(data: response.data, encoding: .utf8) ?? "데이터 없음")")

            statusMessage = "답변이 성공적으로 제출되었습니다!"
            showAlert = true
            resetForm()

        } catch {
            print("❌ 제출 실패: \(error)")
            statusMessage = "답변 제출 실패: \(error.localizedDescription)"
            showAlert = true
        }

        isLoading = false
    }
}

#Preview {
    FormTextPostView(currentUserID: UUID())
}
