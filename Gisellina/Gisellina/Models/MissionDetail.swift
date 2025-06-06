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
    let law: String
    let caseText: String
    let missionId: UUID
    let answer: String
    let categoryId: UUID
    let title: String

    enum CodingKeys: String, CodingKey {
        case id = "detail_id"
        case body = "detail_body"
        case expReward = "detail_exp_reward"
        case law = "detail_law"
        case caseText = "detail_case"
        case missionId = "mission_id"
        case answer = "detail_answer"
        case categoryId = "category_id"
        case title = "detail_title"
    }
}
