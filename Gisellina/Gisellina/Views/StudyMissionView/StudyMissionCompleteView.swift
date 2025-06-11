import Foundation
import SwiftUI


struct StudyMissionCompleteView : View {
    @EnvironmentObject var router: Router  // 라우터 환경객체
    @State private var answer: String? = nil
    @State private var detailCase: String? = nil
    @State private var scrollOffset: CGFloat = 0
    private let screenWidth = UIScreen.main.bounds.width
    
    let currentMissionID: UUID?
    
    //MARK: - Safe Area Top을 설정합니다.
    
    var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 20 // 기본값 20 (예: iPhone SE)
    }
    
    
    var body : some View{

        // 로그 출력
         ZStack {
            Image("StudyMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack {
                //MARK: - Top Navigation Menu Bar(look like Noah View)
                CustomNavigationBar(
                    title: "사건 검토하기",
                    titleColor: .white
                )
                
                Text("답변서 제출이 완료되었습니다.")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                //MARK: - Main View
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center) {
                        VStack {
                            HStack(spacing: 8) {
                                Image("icon-park_good")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                
                                Text("모범 답안")
                                    .font(.title2)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                            
                            ScrollView {
                                Text(detailCase ?? "모범답안이 없습니다.")
                                    .font(.body)
                                    .padding(.horizontal)
                            }
                            .scrollIndicators(.hidden)
                        }
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                        .padding(.vertical, 18)
                        
                        VStack {
                            HStack(spacing: 8) {
                                Image("icon-park_good")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                
                                Text("나의 답안")
                                    .font(.title2)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                            
                            ScrollView {
                                Text(answer ?? "답변이 없습니다.")
                                    .font(.body)
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                        .padding(.vertical, 18)
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 24)
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(maxHeight: 480, alignment: .top)
                
                
                
                Button {
                    router.path = NavigationPath()// <- 핵심 코드
                } label: {
                    StudyButton(studyButtonTitle: "메인으로 가기", studyButtonColor: Color("StudyButton"), studyButtonHeight: 52)
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                print("🟡 전달받은 currentMissionID: \(String(describing: currentMissionID))")
                Task {
                    do {
                        if let missionID = currentMissionID {
                            print("🟢 Supabase 쿼리에 사용된 missionID: \(missionID)")
                            if let info = try await StudyCompleteService.fetchStudyComplete(missionID: missionID) {
                                self.answer = info.answer

                                if let detailID = info.detail_id {
                                    if let missionDetail = try await StudyCompleteService.fetchMissionDetail(detailID: detailID) {
                                        self.detailCase = missionDetail.detail_answer
                                    }
                                }
                            }
                        }
                    } catch {
                        print("❌ 답변 불러오기 실패:", error)
                    }
                }
            }
        }
    }
}

//MARK: - Study Complete Model

struct UserAnswerInfo: Decodable {
    let answer: String?
    let detail_id: UUID?
}

struct MissionDetailModel: Decodable {
    let detail_answer: String?
}

//MARK: - Study CompleteService

struct StudyCompleteService {
    /// 완료된 study 미션의 답변과 detail_id를 모두 가져옵니다.
    static func fetchStudyComplete(missionID: UUID) async throws -> UserAnswerInfo? {
        let client = SupabaseManager.shared.client

        let results: [UserAnswerInfo] = try await client
            .from("map_user_mission_detail")
            .select("answer, detail_id")
            .eq("user_detail_id", value: missionID)
            .limit(1)
            .execute()
            .value

        return results.first
    }
    
    static func fetchMissionDetail(detailID: UUID) async throws -> MissionDetailModel? {
        let client = SupabaseManager.shared.client

        let results: [MissionDetailModel] = try await client
            .from("mission_details")
            .select("detail_answer")
            .eq("detail_id", value: detailID)
            .limit(1)
            .execute()
            .value

        return results.first
    }
}

struct StudyCompleteModel: Identifiable, Codable, Equatable, Hashable {
    let user_detail_id: UUID          // PK
    let created_at: String?           // ISO8601 형식
    let earned_exp: Int?              // int8
    let answer: String?               // 사용자의 답변
    let user_id: UUID                 // 사용자 ID
    let detail_id: UUID               // 미션 상세 ID (FK)
    let is_done: Bool                 // 완료 여부

    enum CodingKeys: String, CodingKey {
        case user_detail_id = "user_detail_id"
        case created_at = "created_at"
        case earned_exp = "earned_exp"
        case answer = "answer"
        case user_id = "user_id"
        case detail_id = "detail_id"
        case is_done = "is_done"
    }

    var id: UUID { user_detail_id }
}





#Preview {
    StudyMissionCompleteView(currentMissionID: UUID())
}
