import SwiftUI

struct StudyMissionView : View {
    
    //MARK: - 변수 설정
    @State private var showHintSheet = false
    
    //MARK: - View Start
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                //MARK: - Top Navigation Menu Bar
                ZStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            showHintSheet.toggle()
                        }) {
                            Image("HintIcon")
                                .foregroundColor(.gray)
                        }
                        .sheet(isPresented: $showHintSheet) {
                            HintSheetView()
                                .presentationDetents([.height(180), .large])
                                .presentationCornerRadius(44)
                                .presentationDragIndicator(.visible)
                                .background(Color.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
                        }
                    }
                    
                    Text("오늘의 공부")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 24)
                .background(Color(red: 0.24, green: 0.73, blue: 1))
                
                
                VStack{
                    Image("MissionCharacter")
                }
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.24, green: 0.73, blue: 1))
                
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
                .padding(.horizontal,24)
                
                NavigationLink {
                    CreateAnswerView()
                } label: {
                    Text("답변 작성하기")
                        .frame(width: 320, height: 44)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 0.24, green: 0.73, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        
    }
}



#Preview {
    StudyMissionView()
}
