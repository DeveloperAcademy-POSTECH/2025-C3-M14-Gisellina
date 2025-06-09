//
//  DailySummary.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct DailySummary: Decodable, Identifiable {
    let id: UUID              // summary_id
    let userId: UUID          // user_id
    let createdAt: String     // created_at
    let totalExp: Int         // total_exp
    let currentCount: [String: Int] // current_count (jsonb → Dictionary)
    let goalCount: [String: Int]  // goal_count (jsonb → Dictionary)

    enum CodingKeys: String, CodingKey {
        case id = "summary_id"
        case userId = "user_id"
        case createdAt = "created_at"
        case totalExp = "total_exp"
        case currentCount = "current_count"
        case goalCount = "goal_count"
    }
}
