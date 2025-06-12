//
//  StudyMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct StudyMissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let createdAt: String
    let answer: String?
    let missionDetail: MissionDetail
    
    var body: String { missionDetail.body }
    var law: String { missionDetail.law! }
    var caseText: String { missionDetail.caseText! }


    enum CodingKeys: String, CodingKey {
        case id = "user_detail_id"
        case createdAt = "created_at"
        case answer = "answer"
        case missionDetail = "mission_details"
    }
}






