import SwiftUI
import Foundation

// MARK: - Supabase 응답을 받을 구조체
struct UserMissionCreatedAt: Decodable {
    let created_at: String
}

struct TimeService {
    // MARK: - created_at 시간 문자열 가져오기
    static func fetchLatestCreatedAt() async throws -> String {
        let client = SupabaseManager.shared.client

        // Supabase에서 가장 최근 created_at 하나만 가져오기
        let result: [UserMissionCreatedAt] = try await client
            .from("map_user_mission_detail")
            .select("created_at")
            .order("created_at", ascending: false)
            .limit(1)
            .execute()
            .value

        // 값이 없을 경우 에러
        guard let createdAt = result.first?.created_at else {
            throw NSError(domain: "No created_at found", code: 0)
        }

        //  로그 출력화면
        print("📅 created_at:", createdAt)
        return createdAt
    }

    // MARK: - UTC -> KST 문자열 변환 함수 (단순화된 버전)
    static func convertUTCToKST(from utcString: String) -> String? {
        print("🔵 [convertUTCToKST] 입력된 UTC 문자열:", utcString)

        // ISO8601DateFormatter로 단순화
        guard let date = parseUTCString(utcString) else {
            print("❌ [convertUTCToKST] 문자열을 Date로 변환 실패")
            return nil
        }

        print("🟢 [convertUTCToKST] 변환된 Date 객체:", date)

        // KST로 변환
        let kstFormatter = DateFormatter()
        kstFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        kstFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")

        let kstString = kstFormatter.string(from: date)
        print("🟡 [convertUTCToKST] KST 변환된 문자열:", kstString)

        return kstString
    }

    // MARK: - UTC 문자열을 Date 객체로 변환 (단순화된 파서)
    private static func parseUTCString(_ utcString: String) -> Date? {
        // 1. ISO8601DateFormatter 시도 (가장 표준적)
        let iso8601Formatter = ISO8601DateFormatter()
        iso8601Formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        if let date = iso8601Formatter.date(from: utcString) {
            return date
        }

        // 2. 기본 ISO8601 (소수점 없이)
        iso8601Formatter.formatOptions = [.withInternetDateTime]
        if let date = iso8601Formatter.date(from: utcString) {
            return date
        }

        // 3. 수동 포맷터 (Supabase 형식)
        let manualFormatter = DateFormatter()
        manualFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
        if let date = manualFormatter.date(from: utcString) {
            return date
        }

        return nil
    }

    // MARK: - 날짜 비교 함수 (같은 날짜인지 확인)
    static func isSameDateAsToday(utcString: String) -> Bool {
        print("📅 [isSameDateAsToday] UTC 문자열과 오늘 날짜 비교 시작: \(utcString)")

        // UTC 문자열을 Date로 변환
        guard let utcDate = parseUTCString(utcString) else {
            print("❌ [isSameDateAsToday] UTC 문자열 파싱 실패")
            return false
        }

        // 현재 시간 (기기의 로컬 시간)
        let currentDate = Date()
        print("🕐 [isSameDateAsToday] 현재 기기 로컬 시간:", currentDate)
        print("🕐 [isSameDateAsToday] 파싱된 UTC Date 객체:", utcDate)

        // 한국 시간대로 통일해서 비교
        let calendar = Calendar.current
        let kstTimeZone = TimeZone(identifier: "Asia/Seoul")!

        // UTC 날짜를 KST로 변환하여 컴포넌트 추출
        let utcComponents = calendar.dateComponents(in: kstTimeZone, from: utcDate)
        // 현재 날짜를 KST로 변환하여 컴포넌트 추출
        let currentComponents = calendar.dateComponents(in: kstTimeZone, from: currentDate)

        let isSameDate = utcComponents.year == currentComponents.year &&
                         utcComponents.month == currentComponents.month &&
                         utcComponents.day == currentComponents.day

        print("🟢 [isSameDateAsToday] UTC 날짜 (KST 기준): \(utcComponents.year ?? 0)-\(utcComponents.month ?? 0)-\(utcComponents.day ?? 0)")
        print("🟢 [isSameDateAsToday] 현재 날짜 (KST 기준): \(currentComponents.year ?? 0)-\(currentComponents.month ?? 0)-\(currentComponents.day ?? 0)")
        print("🔍 [isSameDateAsToday] 두 날짜는 같은 날인가요?: \(isSameDate)")

        return isSameDate
    }

    // MARK: - 현재 Date()와 KST 문자열 비교
    static func compareDateWithKST(kstString: String) -> Bool {
        print("📅 [compareDateWithKST] KST 문자열과 현재 날짜 비교 시작: \(kstString)")

        // KST 문자열을 Date로 변환
        let kstFormatter = DateFormatter()
        kstFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        kstFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")

        guard let kstDate = kstFormatter.date(from: kstString) else {
            print("❌ [compareDateWithKST] KST 문자열 파싱 실패")
            return false
        }

        // 현재 시간
        let currentDate = Date()
        print("🕐 [compareDateWithKST] 현재 기기 로컬 시간:", currentDate)
        print("🕐 [compareDateWithKST] 파싱된 KST Date 객체:", kstDate)

        // 한국 시간대 기준으로 날짜 비교
        let calendar = Calendar.current
        let kstTimeZone = TimeZone(identifier: "Asia/Seoul")!

        let kstComponents = calendar.dateComponents(in: kstTimeZone, from: kstDate)
        let currentComponents = calendar.dateComponents(in: kstTimeZone, from: currentDate)

        let isSameDate = kstComponents.year == currentComponents.year &&
                         kstComponents.month == currentComponents.month &&
                         kstComponents.day == currentComponents.day

        print("🟢 [compareDateWithKST] 비교 대상 KST 날짜: \(kstComponents.year ?? 0)-\(kstComponents.month ?? 0)-\(kstComponents.day ?? 0)")
        print("🟢 [compareDateWithKST] 현재 날짜 (KST 기준): \(currentComponents.year ?? 0)-\(currentComponents.month ?? 0)-\(currentComponents.day ?? 0)")
        print("🔍 [compareDateWithKST] 두 날짜는 같은 날인가요?: \(isSameDate)")

        return isSameDate
    }

    // MARK: - 현재 Date()와 임의의 Date 객체 비교 (보너스)
    static func compareDates(_ date1: Date, with date2: Date) -> Bool {
        print("📅 [compareDates] 두 Date 객체 비교 시작")
        print("🕐 [compareDates] Date 1:", date1)
        print("🕐 [compareDates] Date 2:", date2)

        let calendar = Calendar.current
        let kstTimeZone = TimeZone(identifier: "Asia/Seoul")!

        let components1 = calendar.dateComponents(in: kstTimeZone, from: date1)
        let components2 = calendar.dateComponents(in: kstTimeZone, from: date2)

        let isSame = components1.year == components2.year &&
                     components1.month == components2.month &&
                     components1.day == components2.day

        print("🟢 [compareDates] Date 1 (KST 기준): \(components1.year ?? 0)-\(components1.month ?? 0)-\(components1.day ?? 0)")
        print("🟢 [compareDates] Date 2 (KST 기준): \(components2.year ?? 0)-\(components2.month ?? 0)-\(components2.day ?? 0)")
        print("🔍 [compareDates] 두 날짜는 같은 날인가요?: \(isSame)")

        return isSame
    }
}
//
//// MARK: - SwiftUI 뷰
//struct CreatedAtView: View {
//    @State private var utcTime: String = ""
//    @State private var kstTime: String = ""
//    @State private var errorMessage: String?
//
//    var body: some View {
//        VStack(spacing: 16) {
//            if errorMessage == nil {
//                Text("Supabase 시간 (UTC):")
//                Text(utcTime).bold()
//
//                Text("한국 시간 (KST):")
//                Text(kstTime).bold()
//            } else if let errorMessage = errorMessage {
//                Text("오류: \(errorMessage)")
//                    .foregroundColor(.red)
//                    .padding()
//            }
//        }
//        .padding()
//        // 3. .task 블록에서 일관된 에러 처리
//        .task {
//            do {
//                let fetchedUtcTime = try await TimeService.fetchLatestCreatedAt()
//                self.utcTime = fetchedUtcTime
//                self.kstTime = try TimeService.convertUTCToKST(from: fetchedUtcTime) ?? ""
//
//                // Log the comparison results after fetching and converting
//                _ = TimeService.isSameDateAsToday(utcString: fetchedUtcTime)
//                _ = TimeService.compareDateWithKST(kstString: self.kstTime)
//
//            } catch {
//                // LocalizedError 프로토콜을 따르므로 errorDescription이 자동으로 사용됨
//                self.errorMessage = error.localizedDescription
//            }
//        }
//    }
//}
//
//#Preview {
//    CreatedAtView()
//}
