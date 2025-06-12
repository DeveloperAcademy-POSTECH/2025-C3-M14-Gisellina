//
//  StudyMissionListRowView.swift
//  Gisellina
//
//  Created by Noah on 6/12/25.
//
import SwiftUI

struct StudyMissionListCell: View {
    //     MARK: - Properties
        let missionDetail: MissionList
        
        // MARK: - Initializer
        init(
            missionDetail: MissionList
        ) {
            self.missionDetail = missionDetail
        }
        
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 4) {
                Text(missionDetail.createdAt.prefix(10))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                Text(missionDetail.detailBody)
                    .font(.system(size: 16, weight: .bold))
            }
//            Spacer()
//            
//            Image(systemName: "chevron.right")
//                .font(.system(size: 24, weight: .bold))
//                .foregroundStyle(.blue .opacity(0.5))
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
