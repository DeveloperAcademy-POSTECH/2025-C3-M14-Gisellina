import SwiftUI

struct ExerciseMissionListRowView: View {
    // MARK: - Properties
    let characterImage: String
    let missionDetail: MissionList
    
    // MARK: - Initializer
    init(
        characterImage: String = "CharacterImage",
        missionDetail: MissionList
    ) {
        self.characterImage = characterImage
        self.missionDetail = missionDetail
    }
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            // Character Image
            Image(characterImage)
                .frame(width: 40, height: 40)
                .padding(4)
            
            // Mission Content
            VStack(alignment: .leading, spacing: 4) {
                Text(missionDetail.createdAt)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                
                Text("\(missionDetail.category) | \(missionDetail.category)")
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
