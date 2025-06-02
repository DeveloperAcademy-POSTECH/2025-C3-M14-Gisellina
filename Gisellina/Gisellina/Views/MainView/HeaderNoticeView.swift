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
            Text("변호사님,")
                .bold()
            
            Text("오늘의 업무 어쩌고")
        }
        .foregroundStyle(.c3MainBackground)
        .padding(.horizontal, 37)
        .padding(.vertical, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    HeaderNoticeView()
}
