import SwiftUI

//@EnvironmentObject let missionDetail : MissionList
struct ExerciseMissionListRowView: View {
    
//     MARK: - Properties
    
    let missionDetail: [MissionList]
    
    // MARK: - Initializer
    init(
        missionDetail: [MissionList]
    ) {
        self.missionDetail = missionDetail
    }
    
    var missionTitleText: String {
        missionDetail.map { $0.category }.uniqued().joined(separator: " | ")
    }

    var dateText: String {
        missionDetail.first.map { String($0.createdAt.prefix(10)) } ?? ""
    }
    
    var characterImageName: String {
        let count = missionDetail.count
        return "clear\(min(count, 4))"
    }


    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            // Character Image
            Image(characterImageName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(4)
            
            // Mission Content
            VStack(alignment: .leading, spacing: 4) {
                Text(dateText)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                
                Text(missionTitleText)
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .padding(24)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
        )
    }
}

extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        Array(Set(self))
    }
}
