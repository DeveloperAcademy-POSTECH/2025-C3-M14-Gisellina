//
//  MissionService.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

struct MissionService {
    // MARK: - study 미션 가져오기
    static func fetchOneStudyMission() async throws -> StudyMissionDetail {
        let client = SupabaseManager.shared.client

        let studyMissionDetails: [StudyMissionDetail] = try await client
            .from("mission_details")
            .select("detail_body, detail_id, missions!inner(mission_type)")
            .eq("missions.mission_type", value: "study")
            .execute()
            .value

        
        guard let randomMission = studyMissionDetails.randomElement() else {
            throw NSError(domain: "No study missions found", code: 0)
        }

        return randomMission
    }

    // MARK: - 모든 exercise 미션 가져오기
    static func fetchAllExerciseMissions() async throws -> [ExerciseMissionDetail] {
        let client = SupabaseManager.shared.client
        
        let missionDetails: [ExerciseMissionDetail] = try await client
            .from("mission_details")
            .select("detail_body, detail_id, missions!inner(mission_type)")
            .eq("missions.mission_type", value: "exercise")
            .execute()
            .value
        
        return missionDetails
    }
    
    
}
