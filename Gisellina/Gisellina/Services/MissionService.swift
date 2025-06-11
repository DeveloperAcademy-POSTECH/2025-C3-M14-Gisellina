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
        let userID = UserService.currentUserID()

        let results: [StudyMissionDetail] = try await client
            .from("map_user_mission_detail")
            .select("""
                user_detail_id,
                created_at,
                mission_details!inner(*)
            """)
            .eq("mission_details.mission_type", value: "study")
            .eq("user_id", value: userID)
            .execute()
            .value

        print("🟢 [fetchOneStudyMission] 가져온 미션 수: \(results.count)")
        for mission in results {
            print("📅 [fetchOneStudyMission] 미션 createdAt: \(mission.createdAt)")
        }

        // 오늘 날짜 기준 필터링
        guard let studyMissionDetail = results.first(where: {
            TimeService.isSameDateAsToday(utcString: $0.createdAt)
        }) else {
            print("❌ [fetchOneStudyMission] 오늘 날짜와 일치하는 미션 없음")
            throw MyError.studyMissionNotFound
        }

        print("✅ [fetchOneStudyMission] 오늘 날짜 미션 발견: \(studyMissionDetail)")
        return studyMissionDetail
    }

    // MARK: - 모든 exercise 미션 가져오기
    static func fetchAllExerciseMissions() async throws -> [ExerciseMissionDetail] {
        let client = SupabaseManager.shared.client
        let userID = UserService.currentUserID()
        
        let missionDetails: [ExerciseMissionDetail] = try await client
            .from("map_user_mission_detail")
            .select("user_id, user_detail_id, is_done, mission_details!inner(*)")
            .eq("mission_details.mission_type", value: "exercise")
            .eq("user_id", value: userID)
            .execute()
            .value
        
        return missionDetails
    }
    
    
    //예시 입니다!!!! 돌아가는지 확인 안했어여
//    func fetchDoneMissions() async throws -> [MissionListExample] {
//        let userID = UserService.currentUserID()
//
//        let missions: [MissionListExample] = try await SupabaseManager.shared.client
//            .from("map_user_mission_detail")
//            .select("""
//                user_detail_id,
//                user_id,
//                created_at,
//                mission_details!inner(*)
//            """)
//            .eq("is_done", value: true)
//            .eq("user_id", value: userID)
//            .order("created_at", ascending: false)
//            .execute()
//            .value
//
//        return missions
//    }


}
