//
//  HeaderNoticeView.swift
//  Gisellina
//
//  Created by Jamin on 6/2/25.
//

import SwiftUI

struct HeaderNoticeView: View {
    var body: some View {
        HStack {
            Image("announce_icon")
            Text("변호사님,")
                .bold()
            
            Text("오늘의 업무를 확인하세요")
        }
        .foregroundStyle(.c3ProgressForeground)
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 60))
    }
}

#Preview {
    HeaderNoticeView()
}
