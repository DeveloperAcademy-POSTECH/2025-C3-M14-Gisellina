//
//  MainProgressBar.swift
//  Gisellina
//
//  Created by Jamin on 6/2/25.
//

import SwiftUI

struct MainProgressBar: View {
    @Binding var value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(height: 26)
                    .foregroundStyle(.c3ProgressBackground)
                
                ZStack(alignment: .top) {
                    Capsule()
                        .frame(
                            width: geometry.size.width * value,
                            height: 26
                        )
                        .foregroundStyle(.c3ProgressForeground)
                    Capsule()
                        .frame(
                            width: geometry.size.width * value * 0.9,
                            height: 6
                        )
                        .padding(.top, 7)
                        .foregroundStyle(.c3ProgressBackground).opacity(0.2)

                }
                
            }
        }
        .frame(height: 26)
    }
}

#Preview {
    MainProgressBarPreviewWrapper()
        .padding()
        
}

// 프리뷰용 래퍼 뷰
struct MainProgressBarPreviewWrapper: View {
    @State private var progressValue: CGFloat = 0.65

    var body: some View {
        MainProgressBar(value: $progressValue)
    }
}
