import SwiftUI

struct StudyMissionCompleteView : View {
    @State private var scrollOffset: CGFloat = 0
    private let screenWidth = UIScreen.main.bounds.width
    
    var body : some View{
        VStack(spacing: 0){
            // Title 표준화 작업을 수행해야 한다.
            Text("민법")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment:.center)
            
            
            Text("답변서 제출이 완료되었습니다.")
                .font(.title2)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center) {
                        VStack {
                            Text("모범 답안")
                                .font(.title2)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView {
                                Text("""
                                    Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random
                                    """)
                                .font(.body)
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                        .padding(.vertical, 18)
                        
                        VStack {
                            Text("나의 답안")
                                .font(.title2)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView {
                                Text("""
                                    Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random
                                    """)
                                .font(.body)
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                        .padding(.vertical, 18)
                        
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(maxHeight: 480, alignment: .top)
            }
            
            Button {
                print("메인으로 이동하기")
            } label: {
                Text("메인으로")
                    .frame(width: 320, height: 44)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color(red: 0.24, green: 0.73, blue: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.top, 24)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.topLeading)
    }
}

#Preview {
    StudyMissionCompleteView()
}
