//
//  UserViewModel.swift
//  Gisellina
//
//  Created by Jamin on 6/4/25.
//

import Foundation

@MainActor
final class UserViewModel: ObservableObject {
    @Published var userDailyInfo: UserDailyInfo?
    @Published var errorMessage: String?
    
    func loadUserDailyInfo() async {
        do {
            userDailyInfo = try await UserService.fetchTodaySummary()
            print("UserDailyInfo: \(userDailyInfo!)")
        } catch {
            errorMessage = error.localizedDescription
            print("UserDailyInfo 로드 실패: \(error)")
        }
    }
    
    
}

extension UserViewModel {
    var level: Int {
        guard let exp = userDailyInfo?.user_exp else { return 1 }
        return (exp / 100) + 1
    }

    var progress: CGFloat {
        guard let exp = userDailyInfo?.user_exp else { return 0 }
        return CGFloat(exp % 100) / 100
    }

    var vacation: Int {
        userDailyInfo?.user_vacation ?? 5
    }

    var lawyerTitle: String {
        LawyerRank.title(for: level)
    }

}

enum DailyMissionStatus: String {
    case allDone = "축하해요. 업무를 모두 마쳤어요!"
    case partial = "조금 더 힘내봐요!"
    case notStarted = "오늘의 업무를 확인해보세요!"
}

enum LawyerRank: String {
    case beginner = "Lv.1 초급 변호사"
    case intermediate = "Lv2. 중급 변호사"
    case senior = "Lv.3 고급 변호사"
    case master = "변호사"
    
    static func title(for level: Int) -> String {
        switch level {
        case 1:
            return LawyerRank.beginner.rawValue
        case 2:
            return LawyerRank.intermediate.rawValue
        case 3:
            return LawyerRank.senior.rawValue
        default:
            return LawyerRank.master.rawValue
        }
    }
}
