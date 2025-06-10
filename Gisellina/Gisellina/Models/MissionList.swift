//
//  MissionListExample.swift
//  Gisellina
//
//  Created by Jamin on 6/9/25.
//

import Foundation

struct MissionList: Decodable, Identifiable {
    let id: String
    let userId: String
    
    let missionDetails: MissionDetail
    
    // View에서 보여줘야할 정보들
    let createdAt: String
    var detailBody: String { missionDetails.body }
    var category: String { missionDetails.category }
    var mission: String { missionDetails.mission }

    enum CodingKeys: String, CodingKey {
        case id = "user_detail_id"
        case userId = "user_id"
        case createdAt = "created_at"
        case missionDetails = "mission_details"

    }
}
