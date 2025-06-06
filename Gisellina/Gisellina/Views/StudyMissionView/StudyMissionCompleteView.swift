import SwiftUI

struct StudyMissionCompleteView : View {
    @EnvironmentObject var router: Router  // 라우터 환경객체
    
    @State private var scrollOffset: CGFloat = 0
    private let screenWidth = UIScreen.main.bounds.width
    
    //MARK: - Safe Area Top을 설정합니다.
    
    var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 20 // 기본값 20 (예: iPhone SE)
    }
    
    
    var body : some View{
        ZStack {
            Image("ExerciseMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack {
                //MARK: - Top Navigation Menu Bar(look like Noah View)
                CustomNavigationBar(
                    title: "사건 검토하기",
                    titleColor: .white
                )
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
                                Text("""
                                    Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random
                                    """)
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
                                Text("""
                                    Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random
                                    """)
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
                
                Text("답변서 제출이 완료되었습니다.")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button {
                    router.path = NavigationPath()// <- 핵심 코드
                } label: {
                    Text("메인으로")
                        .frame(width: 320, height: 44)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 0.24, green: 0.73, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    StudyMissionCompleteView()
}
