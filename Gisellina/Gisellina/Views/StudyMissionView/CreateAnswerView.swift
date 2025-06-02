import SwiftUI


struct CreateAnswerView: View {
    @State private var writeANswerText: String = ""
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var isTextEditorFocused: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Text("오늘의 공부")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color(red: 0.24, green: 0.73, blue: 1))
                
                Image("MissionCharacter")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 240)
                    .padding()
                
                Text("답변을 작성해 보세요")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("관련 법령, 판례, 논리를 바탕으로 사례를 분석해 보세요.")
                    .font(.callout)
                    .padding(.bottom)
                
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.2))

                    // Placeholder
                    if writeANswerText.isEmpty {
                        Text("관련 법령, 판례, 논리를 바탕으로 사건을 검토해주세요.")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(12)
                    }

                    TextEditor(text: $writeANswerText)
                        .font(.caption)
                        .padding(8)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .focused($isTextEditorFocused)
                }
                .frame(height: 252)
                .padding()
                
                NavigationLink(destination: {
                    StudyMissionCompleteView()
                }, label: {
                    Text("제출하기")
                        .frame(width: 325, height: 50)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })

                
            }
            .padding()
        }
    }
}

#Preview {
    CreateAnswerView()
}
