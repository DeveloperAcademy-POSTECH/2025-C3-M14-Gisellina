//
//  MyError.swift
//  Gisellina
//
//  Created by Jamin on 6/11/25.
//

import Foundation

enum MyError: Error {
    case studyMissionNotFound
    case exerciseMissionNotFound
    
    var message: String {
        switch self {
        case .studyMissionNotFound:
            return "스터디 미션이 없습니다."
        case .exerciseMissionNotFound:
            return "운동 미션이 없습니다."
        }
    }
}
