import SwiftUI

struct NoahButton: View {
    let text: String
    let action: () -> Void
    let style: NoahButtonStyle
    let size:NoahButtonSize
    
    init(text: String, action: @escaping () -> Void, style: NoahButtonStyle, size: NoahButtonSize) {
        self.text = text
        self.action = action
        self.style = style
        self.size = size
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, minHeight: size.buttonSize)
                .background(style.backgroundColor)
                .foregroundColor(style.foregroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

enum NoahButtonStyle {
    case primary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return .c3Primary
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .primary:
            return .white
        }
    }
}

enum NoahButtonSize {
    case small
    case medium
    case large
    
    var buttonSize: CGFloat {
        switch self {
        case .small:
            return 48
        case .medium:
            return 56
        case .large:
            return 64
        }
    }
}
