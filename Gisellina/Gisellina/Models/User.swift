//
//  User.swift
//  Gisellina
//
//  Created by Jamin on 6/4/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID?
    let name: String
    let exp: Int
    let vacation: Int

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name = "user_name"
        case exp = "user_exp"
        case vacation = "user_vacation"
    }
}
