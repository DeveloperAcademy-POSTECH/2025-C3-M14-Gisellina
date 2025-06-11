//
//  StudyMissionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct StudyMissionListView: View {
    @EnvironmentObject var router: Router
    let missionList: [MissionList]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(missionList) { mission in
                    StudyMissionListCell(missionDetail: mission)
                }
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
    }
}

//#Preview {
//    StudyMissionListView()
//}
