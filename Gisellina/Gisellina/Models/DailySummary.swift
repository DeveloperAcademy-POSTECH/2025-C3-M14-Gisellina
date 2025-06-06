//
//  DailySummary.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct DailySummary: Decodable, Identifiable {
    let id: UUID
    let userId: UUID
    let userMissionId: UUID
    let currentCount: Int
    let createdAt: Date
    let totalExp: Int

    enum CodingKeys: String, CodingKey {
        case id = "summary_id"
        case userId = "user_id"
        case userMissionId = "user_mission_id"
        case currentCount = "current_count"
        case createdAt = "created_at"
        case totalExp = "total_exp"
    }
}
