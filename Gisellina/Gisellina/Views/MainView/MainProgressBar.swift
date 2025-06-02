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
                
                Capsule()
                    .frame(
                        width: geometry.size.width * value,
                        height: 26
                    )
                    .foregroundStyle(.c3ProgressForeground)
            }
        }
        .frame(height: 26)
    }
}
