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
    
    
    // MARK: - UTC -> KST 문자열 변환 함수
    static func convertUTCToKST(from utcString: String) -> String? {
        print("🔵 [convertUTCToKST] 입력된 UTC 문자열:", utcString)
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
        
        guard let date = isoFormatter.date(from: utcString) else {
            print("❌ [convertUTCToKST] 문자열을 Date로 변환 실패")
            return nil
        }
        
        print("🟢 [convertUTCToKST] 변환된 Date 객체:", date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        let kstString = formatter.string(from: date)
        print("🟡 [convertUTCToKST] KST 변환된 문자열:", kstString)
        
        return kstString
    }
    
}


struct CreatedAtView: View {
    @State private var utcTime: String = ""
    @State private var kstTime: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 16) {
            Text("Supabase 시간 (UTC):")
            Text(utcTime).bold()

            Text("한국 시간 (KST):")
            Text(kstTime).bold()

            if let errorMessage = errorMessage {
                Text("오류: \(errorMessage)")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .task {
            do {
                print("⏳ Supabase에서 created_at 값을 요청 중...")
                let result = try await TimeService.fetchLatestCreatedAt()
                print("✅ Supabase에서 받은 created_at:", result)
                
                utcTime = result
                kstTime = TimeService.convertUTCToKST(from: result) ?? "변환 실패"
                
            } catch {
                print("❗️에러 발생:", error.localizedDescription)
                errorMessage = error.localizedDescription
            }
        }
    }
}


#Preview {
    CreatedAtView()
}
