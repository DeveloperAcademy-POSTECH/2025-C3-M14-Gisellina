import SwiftUI
import Foundation
import Supabase




// MARK: - Supabase Key value
let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://yzvinmvscvjoreshnzxx.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl6dmlubXZzY3Zqb3Jlc2huenh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4MjQzMDIsImV4cCI6MjA2NDQwMDMwMn0.Pibi7DI4-yX3KaqgulpP8gJ6lqn5ru4Tniy5dRuQxKQ"
    
)

// MARK: - Mission Detail_View_Model 변수 지정하기

struct MissionTestDetails : Codable, Identifiable {
    let detail_id: UUID
    let detail_body: String
    let detail_exp_reward: Int
    let detail_law: String?
    let detail_case: String?
    let mission_id: UUID
    let detail_answer: String?
    let category_id: UUID
    let detail_title: String?
    let mission_type: String?
    let category_type: String?
    
    enum CodingKeys: String, CodingKey {
        case detail_id
        case detail_body
        case detail_exp_reward
        case detail_law
        case detail_case
        case mission_id
        case detail_answer
        case category_id
        case detail_title
        case mission_type
        case category_type
    }
    
    var id: UUID { detail_id } // Identifiable을 위한 computed property
    
}

//MARK: - Map User Mission Detail View Model 변수 저장하기

struct MapUserMissionTestDetail: Codable, Identifiable {
    let user_detail_id: UUID
    let created_at: String // ISO8601 형식의 문자열로 저장해야 함
    let earned_exp: Int8
    let answer: String
    let user_id: UUID
    let detail_id: UUID
    let is_done: Bool

    enum CodingKeys: String, CodingKey {
        case user_detail_id = "user_detail_id"
        case created_at = "created_at"
        case earned_exp = "earned_exp"
        case answer = "answer"
        case user_id = "user_id"
        case detail_id = "detail_id"
        case is_done = "is_done"
    }
    
    var id: UUID { user_detail_id } //Identifiable 프로토콜을 만족시키기 위한 **computed property.

}


//MARK: - Mission Detail_View Model Check
@MainActor // 데이터는 앱 시작시 같이 불러올 수 있게 main 쓰레드에서 진행함
class SupaBaseStudyMissionTestView: ObservableObject {
    @Published var missionTestDetails: [MissionTestDetails] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    
    // 뷰 모델 불러오는 함수를 만든다.
    func loadMissionDetails() async {
        print("[loadMissionDetils] 호출됨")
        isLoading = true
        errorMessage = nil
        
        do {
            print("⏳ [loadMissionDetails] Supabase에서 데이터 요청 중...")
            
            // supabase에서 받아오는 값을 response로 저장한다.
            let response = try await supabase
                .from("mission_details")
                .select("*")
                .execute()
            
            print("🔍 [loadMissionDetails] Raw data: \(String(data: response.data, encoding: .utf8) ?? "nil")")
            
            // fetchtedDeatils 값ㅇ르 json 형태로 저장한다.
            let fetchedDetails = try JSONDecoder().decode([MissionTestDetails].self, from: response.data)
            print("✅ [loadMissionDetails] 데이터 수신 완료: \(fetchedDetails.count)개")
            
            // supabase에서 받은 값을 missionTestDetails에 저장한다.
            self.missionTestDetails = fetchedDetails
            
        } catch {
            print("❌ [loadMissionDetails] 오류 발생:", error)
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

//MARK: - StudyMissionTestDetailView
struct SupabaseTestDetailView : View {
    
    @StateObject private var viewModel = SupaBaseStudyMissionTestView()
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.isLoading {
                    ProgressView("데이터 로딩 중...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Text("오류 발생")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("다시 시도") {
                            Task {
                                await viewModel.loadMissionDetails()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    List(viewModel.missionTestDetails) { detail in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(detail.detail_title ?? "")
                                .font(.headline)
                            
                            Text("문제: \(String(describing: detail.detail_case))")
                                .font(.subheadline)
                            
                            Text("정답: \(String(describing: detail.detail_answer))")
                                .font(.footnote)
                                .foregroundColor(.green)
                            
                            HStack {
                                Text("미션 ID: \(detail.mission_id.uuidString.prefix(8))")
                                Spacer()
                                Text("보상: \(detail.detail_exp_reward) EXP")
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                            
                            Text("유형: \(String(describing: detail.mission_type)) / \(String(describing: detail.category_type))")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("미션 상세 목록")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("새로고침") {
                        Task {
                            await viewModel.loadMissionDetails()
                        }
                    }
                }
            }
            .task {
                await viewModel.loadMissionDetails()
            }
        }
    }
}

#Preview{
    SupabaseTestDetailView()
}
