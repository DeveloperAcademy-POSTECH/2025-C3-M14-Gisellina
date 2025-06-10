//
//  UserDailyInfo.swift
//  Gisellina
//
//  Created by Jamin on 6/10/25.
//

import Foundation

struct UserDailyInfo: Decodable {
    let user_id: UUID
    let user_exp: Int
    let user_vacation: Int
    let dailySummaries: [DailySummary]
    
    enum CodingKeys: String, CodingKey {
        case user_id = "user_id"
        case user_exp
        case user_vacation
        case dailySummaries = "daily_summaries"
    }
}
