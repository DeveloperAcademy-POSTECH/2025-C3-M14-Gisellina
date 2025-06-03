import SwiftUI

struct StudyMissionView : View {
    //MARK: - 변수 설정
    @State private var showHintSheet = false
    @Environment(\.dismiss) var dismiss
    
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
                ZStack{
                    HStack {
                        Button{
                          dismiss()
                        } label:{
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    
                    HStack{
                        Text("오늘의 공부")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            showHintSheet.toggle()
                        } label: {
                            Image("HintIcon")
                                .foregroundColor(.gray)
                        }
                        .sheet(isPresented: $showHintSheet) {
                            HintSheetView()
                                .presentationDetents([.height(180), .medium])
                                .presentationCornerRadius(44)
                                .presentationDragIndicator(.visible)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
                
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
