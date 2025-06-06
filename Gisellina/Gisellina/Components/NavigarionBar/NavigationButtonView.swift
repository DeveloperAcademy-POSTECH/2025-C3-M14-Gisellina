//
//  NavigarionButton.swift
//  Gisellina
//
//  Created by Noah on 6/3/25.
//

import SwiftUI

struct NavigationIconButton: View {
    let action: () -> Void
    let iconName: String
    let iconColor: Color  // ← 아이콘 색상 추가

    init(
        action: @escaping () -> Void,
        iconName: String,
        iconColor: Color = .white  // ← 기본값은 흰색
    ) {
        self.action = action
        self.iconName = iconName
        self.iconColor = iconColor
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .foregroundColor(iconColor) // ← 여기서 적용
                .font(.system(size: 24, weight: .bold))
        }
        .frame(width: 40, height: 40)
    }
}
