import SwiftUI

struct TestView: View {
    var body: some View {
        
        VStack( spacing: 0){
            Text("Display1")
                .customFont(.display1)
            Text("Title1")
                .customFont(.title1)
            Text("Title2")
                .customFont(.title2)
            Text("Body1")
                .customFont(.body1)
            Text("Body2")
                .customFont(.body2)
            Text("Body3")
                .customFont(.body3)
            Text("Label1")
                .customFont(.label1)
            Text("Label2")
                .customFont(.label2)
            Text("Label3")
                .customFont(.label3)
            Text("Label4")
                .customFont(.label4)
            Text("Caption1")
                .customFont(.caption1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}


#Preview {
    TestView()
}
