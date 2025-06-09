//
//  UserService.swift
//  Gisellina
//
//  Created by Jamin on 6/4/25.
//

import Foundation

struct UserService {
    // 앱 접속시 자동 로그인 위한 함수
    static func registerIfNeeded() async {
        let client = SupabaseManager.shared.client

        if UserDefaults.standard.string(forKey: "user_id") == nil {
            let uuid = UUID().uuidString
            let name = "Test \(uuid.prefix(4))"
            
            do {
                try await client
                    .from("users").insert([
                    "user_id": uuid,
                    "user_name": name
                    ]).execute()
                UserDefaults.standard.set(uuid, forKey: "user_id")
                print("✅ 새 유저 등록됨 → \(name) (\(uuid))")
            } catch {
                print("유저 등록 실패: \(error)")
            }
        } else {
            print("가입된 유저: \(UserDefaults.standard.string(forKey: "user_id")!)")
        }
    }

    static func currentUserID() -> String? {
        return UserDefaults.standard.string(forKey: "user_id")
    }
    
    
}

