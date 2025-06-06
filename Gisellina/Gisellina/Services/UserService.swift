//
//  UserService.swift
//  Gisellina
//
//  Created by Jamin on 6/4/25.
//

import Foundation

struct UserService {
    static func fetchUsers() async throws -> [User] {
        let client = SupabaseManager.shared.client

        let users: [User] = try await client
            .from("users")
            .select("user_id, user_name, user_exp, user_vacation")
            .execute()
            .value

        return users
    }

    static func addUser(name: String, exp: Int, vacation: Int) async throws {
        let client = SupabaseManager.shared.client

        let newUser = User(
            id: nil, // 새로 insert할 땐 id 없음
            name: name,
            exp: exp,
            vacation: vacation
        )

        _ = try await client
            .from("users")
            .insert(newUser)
            .execute()
    }
}
