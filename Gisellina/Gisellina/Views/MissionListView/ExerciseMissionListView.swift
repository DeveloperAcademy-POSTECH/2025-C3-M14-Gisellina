//
//  ExerciseMisiionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionListView: View {
    @EnvironmentObject var router: Router
    let missionList: [MissionList]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(missionList) { mission in
                    ExerciseMissionListRowView(characterImage: "characterImage", missionDetail: mission)
                }
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
    }
}

