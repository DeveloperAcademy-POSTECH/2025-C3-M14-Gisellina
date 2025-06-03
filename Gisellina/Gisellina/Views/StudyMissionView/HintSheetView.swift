import SwiftUI

struct HintSheetView: View {
    var body : some View {
        ScrollView{
            VStack(alignment: .leading) {
                VStack {
                    //Ttitle Components 필요함
                    Text("관련법률")
                        .padding(.vertical, 32)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n")
                }
                
                VStack {
                    //Ttitle Components 필요함
                    Text("판례")
                        .padding(.vertical, 8)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다.갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. /n ")
                }
            }
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .topLeading)
        .scrollIndicators(.hidden)
        .background(Color.black.opacity(0.2))
    }
}

#Preview {
    HintSheetView()
}
