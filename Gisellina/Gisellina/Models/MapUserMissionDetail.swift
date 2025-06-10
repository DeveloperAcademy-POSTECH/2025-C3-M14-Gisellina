//
//  MapUserMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct MapUserMissionDetail: Decodable, Identifiable {
    let id: UUID
    let createdAt: Date
    let earnedExp: Int
    let answer: String
    let userId: UUID
    let detailId: UUID
    let isDone: Bool

    enum CodingKeys: String, CodingKey {
        case id = "user_detail_id"
        case createdAt = "created_at"
        case earnedExp = "earned_exp"
        case answer
        case userId = "user_id"
        case detailId = "detail_id"
        case isDone = "is_done"
    }
}
