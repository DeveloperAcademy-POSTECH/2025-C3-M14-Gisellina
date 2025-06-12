import SwiftUI

struct HintSheetView: View {
    var body : some View {
        ScrollView{
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    //Ttitle Components 필요함
                    Text("관련법률")
                        .padding(.vertical, 4)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("민법 제536조 제1항")
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading) {
                    //Ttitle Components 필요함
                    Text("판례")
                        .padding(.vertical, 4)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("대법원 2006. 9. 22. 선고 2006다24049 판결")
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.bottom, 4)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .topLeading)
        .scrollIndicators(.hidden)
        .background(.white)
    }
}

#Preview {
    HintSheetView()
}
