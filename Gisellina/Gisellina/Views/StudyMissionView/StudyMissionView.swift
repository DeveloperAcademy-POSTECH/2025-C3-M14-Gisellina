import SwiftUI

struct StudyMissionView : View {
    
    //MARK: - 변수 설정
    @State private var showHintSheet = false
    
    //MARK: - View Start
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                //MARK: - Top Navigation Menu Bar
                ZStack {
                    HStack {
                        Spacer()
                        NavigationLink {
                            CreateAnswerView()
                        } label: {
                            Text("작성하기")
                        }
                    }
                    .padding(.horizontal, 12)
                    
                    Text("오늘의 민법")
                        .font(.title)
                        .fontWeight(.bold)
                }
                //MARK: - 문제 화면 출력
                VStack{
                    Text("문제")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 12)
                    ZStack(alignment: .bottomTrailing){
                        ScrollView{
                            Text("1. 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?\n갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요? \n 갑과 을은 갑 소유의 주택에 대한 매매계약을 체결하였고, 이에 따라 을은 계약금만 지급한 채 잔금을 지급하지 않던 중 갑 소유 주택이 원인을 알 수 없는 화재로 소실되었습니다. 이 경우 갑은 을에게 잔금을 청구할 수 있는지요?")
                                .font(.body)
                                .lineSpacing(6)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 40)
                        }
                        .scrollIndicators(.hidden)
                        
                        Button {
                            showHintSheet = true
                        } label: {
                            Text("Hint")
                                .frame(width: 48, height: 48)
                                .background(Color.black)
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                                .padding(.bottom, 16)
                                .padding(.trailing, 24)
                        }
                        .sheet(isPresented: $showHintSheet) {
                            HintSheetView()
                                .presentationDetents([.medium])
                        }
                    }
                }
                .padding()
            }
        }
    }
}


struct CreateAnswerView : View {
    @State private var writeANswerText : String = ""
    
    var body : some View{
        VStack{
            ZStack {
                HStack {
                    Spacer()
                    Button {
                        print("제출하기 버튼을 클릭헀습니다.")
                    } label: {
                        Text("제출하기")
                    }
                }
                .padding(.horizontal, 12)
                
                Text("답변작성")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text("오늘의 답안 작성하기")
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                
                TextEditor(text: $writeANswerText)
                    .padding(12)
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}


struct StudyMissionCompleteView : View {
    var body : some View{
        VStack{
            
            HStack {
                Spacer()
                Button {
                    print("제출하기 버튼을 클릭헀습니다.")
                } label: {
                    Text("메인으로 가기")
                }
            }
            .padding(.horizontal, 12)
            
            Text("오늘의 민법 공부 완료!")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment:.leading)
            
            VStack{
                Text("모범답변")
                    .font(.title2)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    Text("""
                    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet", comes from a line in section 1.10.32.
                    
                    The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
                    """)
                    .font(.body)
                    .padding()
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
                }
                .frame(maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scrollIndicators(.hidden)
                
                
                
            }
            .frame(maxWidth:.infinity, alignment:.leading)
            
            VStack{
                Text("작성답변")
                    .font(.title2)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    Text("""
                    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet", comes from a line in section 1.10.32.
                    
                    The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
                    """)
                    .font(.body)
                    .padding()
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
                }
                .frame(maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scrollIndicators(.hidden)
                
                
                
            }
            .frame(maxWidth:.infinity, alignment:.leading)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.topLeading)
    }
}

#Preview {
    StudyMissionView()
}
