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

}

enum DailyMissionStatus: String {
    case allDone = "축하해요. 업무를 모두 마쳤어요!"
    case partial = "조금 더 힘내봐요!"
    case notStarted = "오늘의 업무를 확인해보세요!"
}
