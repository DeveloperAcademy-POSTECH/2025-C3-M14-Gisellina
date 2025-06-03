import SwiftUI

struct HintButtonView: View{
    
    @Binding var showHintSheet: Bool
    var isHintAvailable: Bool = true
    
    var body: some View{
        HStack {
            if isHintAvailable{
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
        }
    }
}

