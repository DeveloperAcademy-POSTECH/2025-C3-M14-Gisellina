//
//  MainButton.swift
//  Gisellina
//
//  Created by Jamin on 6/2/25.
//

import SwiftUI

struct MainButton: View {
    let type: MainButtonType
    let action: () -> Void
    let iconName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .padding(.top, 14)
                .foregroundStyle(.c3MainButtonShadow)
            
            RoundedRectangle(cornerRadius: 15)
                .padding(.top, 14)
                .padding(.bottom, 5)
                .foregroundStyle(.c3MainButtonForeground)
                
            VStack(alignment: .leading) {
                Image(iconName)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(type.title)
                        .bold()
                        .font(.headline)
                    
                    Text(type.description)
                        .font(.callout)
                }
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(height: 190)
        .background(.clear)
        .contentShape(Rectangle()) // 빈 영역도 터치 가능하게
        .onTapGesture {
            action()
        }
    }
}

enum MainButtonType {
    case study
    case exercise
    
    var title: String {
        switch self {
        case .study:
            return "사건 검토하기"
        case .exercise:
            return "컨디션 점검"
        }
    }
    
    var description: String {
        switch self {
        case .study:
            return "의뢰인의 법률 질문을 \n해결하고 공부해요"
        case .exercise:
            return "건강도 훈련! \n몸과 마음을 점검해요"
        }
    }
}

//#Preview {
//    MainButton(type: .exercise, action: {})
//}
