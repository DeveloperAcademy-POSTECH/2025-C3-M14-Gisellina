//
//  ExerciseMisiionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionListView: View {
    @EnvironmentObject var router: Router
    let missionList: [GroupedMissionList]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(missionList) { group in
                    ExerciseMissionListRowView(
                        missionDetail: group.missions
                    )
                }

            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
    }
}

