//
//  MapUserMission.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct MapUserMission: Decodable, Identifiable {
    let id: UUID
    let fixedDate: Date
    let userId: UUID
    let missionId: UUID
    let goalCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "user_mission_id"
        case fixedDate = "fixed_date"
        case userId = "user_id"
        case missionId = "mission_id"
        case goalCount = "goal_count"
    }
}
