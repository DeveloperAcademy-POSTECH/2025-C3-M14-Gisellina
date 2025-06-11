//
//  ExerciseMissionDetail.swift
//  Gisellina
//
//  Created by Jamin on 6/6/25.
//
import Foundation

struct ExerciseMissionDetail: Decodable, Identifiable, Equatable, Hashable {
    let id: UUID
    let userId: UUID
    let exerciseDetail: MissionDetail
    let isDone: Bool
    let createdAt: String
    
    
    var exerciseBody: String { exerciseDetail.body }
    var title: String { exerciseDetail.title ?? "제목 없음" }

    enum CodingKeys: String, CodingKey {
        case id = "user_detail_id"
        case userId = "user_id"
        case exerciseDetail = "mission_details"
        case isDone = "is_done"
        case createdAt = "created_at"
    }
}

