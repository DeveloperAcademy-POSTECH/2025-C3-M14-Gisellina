import SwiftUI

struct StudyMissionView : View {
    @EnvironmentObject var router: Router
    //MARK: - 변수 설정
    @State private var showHintSheet = false
    
    //MARK: - Safe Area Top을 설정합니다.
    
    var safeAreaTop: CGFloat {
            UIApplication.shared.connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
                .first ?? 20 // 기본값 20 (예: iPhone SE)
        }
    

    //MARK: - View Start
    var body: some View {
        
        ZStack {
            Image("ExerciseMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            
            VStack(spacing: 12){
                
                //MARK: - Top Navigation Menu Bar(look like Noah View)
                CustomNavigationBar(
                    title: "사건 검토하기",
                    titleColor: .white,    // ← 제목 텍스트 색상
                    leftItem: AnyView(
                        NavigationIconButton(
                            action: { router.pop() },
                            iconName: "chevron.left",
                            iconColor: .white     // ← 아이콘 색상
                        )
                    ),
                    rightItem: AnyView(
                        NavigationIconButton(
                            action: { router.pop() },
                            iconName: "gear",
                            iconColor: .white  // ← 오른쪽 아이콘 색상
                        )
                    )
                )
                
                VStack{
                    Image("MissionCharacter")
                }
                .frame(maxWidth: .infinity)
                //MARK: - Data 가정해져야 한다.
                VStack{
                    ZStack(alignment: .bottomTrailing){
                        ScrollView{
                            Text("1. 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?\n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?")
                                .font(.body)
                                .lineSpacing(6)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 40)
                        }
                        .frame(height: 260)
                        .scrollIndicators(.hidden)
                    }
                }
                
                .padding(.top, 36)
                
                NavigationLink {
                    CreateAnswerView()
                } label: {
                    Text("답변작성")
                        .frame(width: 320, height: 44)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    StudyMissionView()
}
