import SwiftUI

struct StudyMissionView : View {
    @EnvironmentObject var router: Router
    //MARK: - 변수 설정
    @State private var showHintSheet = false

    @Environment(\.dismiss) var dismiss
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
                            action: { showHintSheet.toggle() },
                            iconName: "gear",
                            iconColor: .white  // ← 오른쪽 아이콘 색상
                        )
                        .sheet(isPresented: $showHintSheet) {
                            HintSheetView()
                                .presentationDetents([.height(180), .large])
                                .presentationCornerRadius(44)
                                .presentationDragIndicator(.visible)
                                .background(Color.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
                        }
                    )
                )
                
                VStack{
                    Image("MissionCharacter")
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity)
                //MARK: - Data 가정해져야 한다.
                VStack{
                    ZStack(alignment: .bottomTrailing){
                        ScrollView{
                            Text(mission.body)
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

