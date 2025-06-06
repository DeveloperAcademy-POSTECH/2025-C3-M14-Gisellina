//
//  NavigationBar.swift
//  Gisellina
//
//  Created by Noah on 6/3/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    let titleColor: Color         // 제목 색상
    let leftItem: AnyView?
    let rightItem: AnyView?

    init(
        title: String,
        titleColor: Color = .white,     // ← 기본값은 흰색
        leftItem: AnyView? = nil,
        rightItem: AnyView? = nil
    ) {
        self.title = title
        self.titleColor = titleColor
        self.leftItem = leftItem
        self.rightItem = rightItem
    }

    var body: some View {
        ZStack {
            HStack {
                leftItem ?? AnyView(Spacer().frame(width: 40))
                Spacer()
                rightItem ?? AnyView(Spacer().frame(width: 40))
            }

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(titleColor)   // ← 여기에 적용
        }
        .padding(.vertical, 10)
    }
}
