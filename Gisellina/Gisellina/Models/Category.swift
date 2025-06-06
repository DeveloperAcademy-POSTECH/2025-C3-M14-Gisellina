//
//  Category.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

struct Category: Decodable, Identifiable {
    let id: UUID
    let title: String   // 민법, 형법, 스트레칭, 산책 등

    enum CodingKeys: String, CodingKey {
        case id = "category_id"
        case title = "category_title"
    }
}
