//
//  ExerciseMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//
import Foundation

struct ExerciseMissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let body: String
    let exerciseMissionMeta: ExerciseMissionMeta

    enum CodingKeys: String, CodingKey {
        case id = "detail_id"
        case body = "detail_body"
        case exerciseMissionMeta = "missions"
    }
}

struct ExerciseMissionMeta: Decodable, Equatable, Hashable {
    let mission_type: String
}
