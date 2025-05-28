import SwiftUI

struct BabaButton: View {
    // 변수 설정
    let babaButtonTitle : String
    let babaButtonStyle : babaButtonStyle // 버튼 스타일 정의할 것
    var babaButtonAction : () -> Void
    
    // 초기화 설정
    
    init(
        buttonTitle: String,
        buttonStyle: babaButtonStyle,
        action: @escaping () -> Void
    ) {
        self.babaButtonTitle = buttonTitle
        self.babaButtonStyle = buttonStyle
        self.babaButtonAction = action
    }
    
    var body: some View {
        Button(action: babaButtonAction) {
            Text(babaButtonTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, minHeight: babaButtonStyle.babaButtonHeight)
                .background(babaButtonStyle.babaButtonBackgroundColor)
                .foregroundColor(babaButtonStyle.babaButtonForegroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}


enum babaButtonStyle {
    case primary
    
    var babaButtonBackgroundColor: Color {
        switch self {
        case .primary:
            return .black.opacity(0.3)
        }
    }
    
    var babaButtonForegroundColor: Color {
        switch self {
        case .primary:
            return .white
        }
    }
    
    var babaButtonHeight: CGFloat {
        return 48
    }
    
}

#Preview {
    BabaButton(buttonTitle: "Button", buttonStyle: .primary) {
        print("tex")
    }
}
