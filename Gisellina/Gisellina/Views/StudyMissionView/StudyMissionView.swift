import SwiftUI

struct StudyMissionView : View {
    
    //MARK: - 변수 설정
    @State private var showHintSheet = false
    
    //MARK: - View Start
    var body: some View {
        VStack(spacing: 0){
            
            //MARK: - Top Navigation Menu Bar
            ZStack {
                HStack {
                    Button {
                        print("뒤로가기 버튼 클릭")
                    } label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Button {
                        print("작성하기 버튼 클릭")
                    } label: {
                        Text("작성하기")
                    }
                }
                .padding(.horizontal, 12)
                
                Text("오늘의 민법")
                    .font(.title)
                    .fontWeight(.bold)
            }
            //MARK: - 문제 화면 출력
            VStack{
                Text("문제")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 12)
                ZStack(alignment: .bottomTrailing){
                    ScrollView{
                        Text("1. 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?\n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?")
                            .font(.body)
                            .lineSpacing(6)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 40)
                    }
                    .scrollIndicators(.hidden)
                    
                    Button {
                        showHintSheet = true
                    } label: {
                        Text("Hint")
                            .frame(width: 48, height: 48)
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .padding(.bottom, 16)
                            .padding(.trailing, 24)
                    }
                    .sheet(isPresented: $showHintSheet) {
                        HintSheetView()
                            .presentationDetents([.medium])
                    }
                }
            }
            .padding()
        }
    }
}



#Preview {
    StudyMissionView()
}
