//
//  StudyMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//

import Foundation

struct StudyMissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let body: String
    let studyMissionMeta: StudyMissionMeta

    enum CodingKeys: String, CodingKey {
        case id = "detail_id"
        case body = "detail_body"
        case studyMissionMeta = "missions"
    }
}

struct StudyMissionMeta: Decodable, Equatable, Hashable {
    let mission_type: String
}
