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

struct MissionListService {
    // MARK: - 미션리스트에 추가하기
    static func fetchDoneMissions() async throws -> [MissionList] {
            let userID = UserService.currentUserID()
    
            let missions: [MissionList] = try await SupabaseManager.shared.client
                .from("map_user_mission_detail")
                .select("""
                    user_detail_id,
                    user_id,
                    created_at,
                    mission_details!inner(*)
                """)
                .eq("is_done", value: true)
                .eq("user_id", value: userID)
                .order("created_at", ascending: false)
                .execute()
                .value
    
            return missions
        }

}
