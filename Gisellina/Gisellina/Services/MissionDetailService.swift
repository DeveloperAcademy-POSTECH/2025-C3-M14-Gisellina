//
//  MissionDetailService.swift
//  Gisellina
//
//  Created by Noah on 6/10/25.
//

//
//  MissionService.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

struct MissionDetail {
    // MARK: - study 미션 가져오기
    static func fetchOneStudyMission() async throws -> StudyMissionDetail {
        let client = SupabaseManager.shared.client
        let userID = UserService.currentUserID()

        let studyMissionDetail: StudyMissionDetail = try await client
            .from("map_user_mission_detail")
            .select("""
                detail_id,
                mission_details!inner(*)
            """)
            .eq("mission_details.mission_type", value: "study")
            .eq("user_id", value: userID)
            .single()
            .execute()
            .value

        return studyMissionDetail
    }

    // MARK: - 모든 exercise 미션 가져오기
    static func fetchAllExerciseMissions() async throws -> [ExerciseMissionDetail] {
        let client = SupabaseManager.shared.client
        
        let missionDetails: [ExerciseMissionDetail] = try await client
            .from("map_user_mission_detail")
            .select("detail_id, mission_details!inner(*)")
            .eq("mission_details.mission_type", value: "exercise")
            .execute()
            .value
        
        return missionDetails
    }

}
