//
//  NoahView.swift
//  Gisellina
//
//  Created by Jamin on 5/27/25.
//

import SwiftUI

struct NoahView: View {
    var body: some View {
        // TODO: NoahButton() 추가하기
        VStack{
            NoahButton(
                text: "노아 버튼",
                action: { print("눌림") },
                style: .primary,
                size: .large
            )
            NoahButton(
                text: "노아 버튼",
                action: { print("눌림") },
                style: .primary,
                size: .small
            )
        }
        .padding()
    }
}


#Preview {
    NoahView()
}
