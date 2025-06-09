//
//  MissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

struct MissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let body: String
    let expReward: Int
    let law: String?
    let caseText: String?
    let mission: String
    let answer: String?
    let category: String
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id = "detail_id"
        case body = "detail_body"
        case expReward = "detail_exp_reward"
        case law = "detail_law"
        case caseText = "detail_case"
        case mission = "mission_type"
        case answer = "detail_answer"
        case category = "category_type"
        case title = "detail_title"
    }
}
