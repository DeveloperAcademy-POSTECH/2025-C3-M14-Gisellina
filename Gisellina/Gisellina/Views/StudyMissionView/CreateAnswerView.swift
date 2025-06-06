import SwiftUI


struct CreateAnswerView: View {
    @State private var writeANswerText: String = ""
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var isTextEditorFocused: Bool
    
    @EnvironmentObject var router: Router
    
    //MARK: - Safe Area Top을 설정합니다.
    
    var safeAreaTop: CGFloat {
            UIApplication.shared.connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
                .first ?? 20 // 기본값 20 (예: iPhone SE)
        }
    
    
    //MARK: - View Start
    var body: some View {
        ZStack {
            Image("ExerciseMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            
            VStack(spacing: 12){
                
                //MARK: - Top Navigation Menu Bar(look like Noah View)
                CustomNavigationBar(
                    title: "사건 검토하기",
                    titleColor: .white,    // ← 제목 텍스트 색상
                    leftItem: AnyView(
                        NavigationIconButton(
                            action: { router.pop() },
                            iconName: "chevron.left",
                            iconColor: .white     // ← 아이콘 색상
                        )
                    )
                )
                
                
                VStack{
                    Image("MissionCharacter")
                }
                .frame(maxWidth: .infinity)
                
                
                Text("답변을 작성해 보세요")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("관련 법령, 판례, 논리를 바탕으로 사례를 분석해 보세요.")
                    .font(.callout)
                    .padding(.bottom)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                    
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
                
                NavigationLink(destination: {
                    StudyMissionCompleteView()
                }, label: {
                    Text("제출하기")
                        .frame(width: 240, height: 50)
                        .foregroundStyle(.white)
                        .background(Color(red: 0, green: 0.58, blue: 0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreateAnswerView()
}
