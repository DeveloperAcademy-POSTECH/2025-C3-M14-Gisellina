//
//  contentView.swift
//  Gisellina
//
//  Created by Noah on 6/4/25.
//

import SwiftUI

struct contentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            CustomNavigationBar(
                title: "내 타이틀",
                titleColor: .white,    // ← 제목 텍스트 색상
                leftItem: AnyView(
                    NavigationIconButton(
                        action: { router.pop() },
                        iconName: "chevron.left",
                        iconColor: .white     // ← 아이콘 색상
                    )
                ),
                rightItem: AnyView(
                    NavigationIconButton(
                        action: { router.pop() },
                        iconName: "gear",
                        iconColor: .white  // ← 오른쪽 아이콘 색상
                    )
                )
            )
            Spacer()
            CustomNavigationBar(
                title: "내 타이틀",
                titleColor: .white,    // ← 제목 텍스트 색상
                leftItem: AnyView(
                    NavigationIconButton(
                        action: { router.pop() },
                        iconName: "chevron.left",
                        iconColor: .white  // ← 오른쪽 아이콘 색상
                    )
                )
            )
            Spacer()
            CustomNavigationBar(
                title: "내 타이틀",
                titleColor: .white,    // ← 제목 텍스트 색상
                rightItem: AnyView(
                    NavigationIconButton(
                        action: { router.pop() },
                        iconName: "gear",
                        iconColor: .white  // ← 오른쪽 아이콘 색상
                    )
                )
            )
            Spacer()
        }
        .background(.blue)
    }
}

#Preview {
    contentView()
}
