//
//  ExerciseMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//
import Foundation

struct ExerciseMissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let exerciseDetail: MissionDetail
    
    var body: String { exerciseDetail.body }

    enum CodingKeys: String, CodingKey {
        case id = "detail_id"
        case exerciseDetail = "mission_details"
    }
}

