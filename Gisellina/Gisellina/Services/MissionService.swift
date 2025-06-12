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
            answer,
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
        
        let results: [ExerciseMissionDetail] = try await client
            .from("map_user_mission_detail")
            .select("user_id, user_detail_id, is_done, created_at, mission_details!inner(*)")
            .eq("mission_details.mission_type", value: "exercise")
            .eq("user_id", value: userID)
            .execute()
            .value
        
        let exerciseMissions = results.filter {
            TimeService.isSameDateAsToday(utcString: $0.createdAt)
        }
        
        guard !exerciseMissions.isEmpty else {
            print("🟡 오늘 날짜와 일치하는 운동 미션 없음")
            throw MyError.studyMissionNotFound
        }
        
        return exerciseMissions
    }
    
    
    
    
}
