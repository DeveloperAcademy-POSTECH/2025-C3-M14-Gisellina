//
//  Mission.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

struct Mission: Decodable, Identifiable {
    let id: UUID
    let type: String  // "study" 또는 "exercise"

    enum CodingKeys: String, CodingKey {
        case id = "mission_id"
        case type = "mission_type"
    }
}
