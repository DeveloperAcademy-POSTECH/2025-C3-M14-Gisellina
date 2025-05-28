//
//  ContentView.swift
//  Gisellina
//
//  Created by Jamin on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            // 기본 SwiftUI 버튼
            Button(action: {
                print("기본 버튼 선택됨")
            }) {
                Text("기본 버튼")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            // JamButton 컴포넌트 버튼
            JamButton(title: "잼 버튼 활용", style: .primary) {
                print("잼 버튼 선택됨")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
