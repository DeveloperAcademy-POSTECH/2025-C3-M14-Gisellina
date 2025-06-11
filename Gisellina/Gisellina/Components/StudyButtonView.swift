import SwiftUI

struct StudyButton: View {
    
    let studyButtonTitle : String
    let studyButtonColor : Color
    let studyButtonHeight : Int
    
    var body: some View {
        VStack{
            Text(studyButtonTitle)
                .frame(maxWidth:.infinity, maxHeight: CGFloat(studyButtonHeight), alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(studyButtonColor)
                .clipShape(RoundedRectangle(cornerRadius: 60))
            
            
        }
    }
}


#Preview{
    StudyButton(studyButtonTitle: "Preview", studyButtonColor: Color("StudyButton"), studyButtonHeight: 45)
}
