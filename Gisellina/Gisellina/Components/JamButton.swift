//
//  JamButton.swift
//  Gisellina
//
//  Created by Jamin on 5/27/25.
//

import SwiftUI

struct JamButton: View {
    let title: String
    let style: JamButtonStyle
    var action: () -> Void
    
    init(
        title: String,
        style: JamButtonStyle = .primary,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, minHeight: style.height)
                .background(style.backgroundColor)
                .foregroundColor(style.foregroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

enum JamButtonStyle {
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
    
    var height: CGFloat {
        return 48
    }
}


#Preview {
    JamButton(title: "완료", action: {})
}
