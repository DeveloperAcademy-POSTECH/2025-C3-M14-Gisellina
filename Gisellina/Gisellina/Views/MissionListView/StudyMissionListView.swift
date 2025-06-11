//
//  StudyMissionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct StudyMissionListView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(0..<6) { _ in
                    StudyMissionListCell()
                }
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
    }
}

struct StudyMissionListCell: View {
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 4) {
                Text("2025.06.01")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                Text("Q. 증여자가 수증기의 범죄행위를 원인으로 하여 증여계약을 수증자가 그...")
                    .font(.system(size: 16, weight: .bold))
            }
            Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
            Image(systemName: "chevron.right")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.blue .opacity(0.5))
        }
        .padding(24)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
            )
    }
}

#Preview {
    StudyMissionListView()
}
