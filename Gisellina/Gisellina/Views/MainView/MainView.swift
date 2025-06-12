//
//  MainView.swift
//  Gisellina
//
//  Created by Jamin on 5/28/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    @StateObject private var viewModel = MissionViewModel()
    @StateObject private var userViewModel = UserViewModel()
    @State private var progressValue: CGFloat = 0.5
    @State private var startValue: CGFloat = 0
    @State private var lottieAnimationName: String = "sleeping"
    private let animationCycle = ["hello", "sleeping", "crying"]
    @State private var currentAnimationIndex: Int = 0

    
    @State private var isLoaded = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                ShakeDetectorView() {
                    currentAnimationIndex = (currentAnimationIndex + 1) % animationCycle.count
                        lottieAnimationName = animationCycle[currentAnimationIndex]
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                }
                .frame(width: 0, height: 0)
                
                Image("MainView_background")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                
                VStack() {
                    HStack {
                        Spacer()
                        VStack {
                            Text("\(userViewModel.vacation)")
                                .frame(width: 40, height: 40)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.c3ProgressForeground)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 7))
                                
                            
                            Text("잔여월차")
                                .foregroundStyle(.white)
                                .font(.system(size: 15, weight: .bold))
                        }
                        
                        VStack{
                            Image(.missionListIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .onTapGesture {
                                    router.push(.missionList)
                                }
                            Text("업무내역")
                                .foregroundStyle(.white)
                                .font(.system(size: 15, weight: .bold))
                        }
                    }
                    
                    HeaderNoticeView()
                        .padding(.top, 30)
                    
                    ZStack {
                        LottieView(animationName: lottieAnimationName)
                            .id(lottieAnimationName) // 애니메이션 이름 변경 시 새로 로드됨
                            .transition(.opacity)    // 페이드 전환
                            .animation(.easeInOut(duration: 0.4), value: lottieAnimationName)
                    }
                    .frame(height: 200)
                    
                    VStack {
                        
                        HStack {
                            Text(userViewModel.lawyerTitle)
                                .font(.system(size: 14, weight: .semibold))
                                .onTapGesture {
                                    UserService.resetUserID()
                                    Task {
                                        await UserService.registerIfNeeded()
                                    }

                                    }
                            
                            Spacer()
                            
                            let percentText = "\(Int(progressValue * 100))%"
                            Text(percentText)
                                .font(.system(size: 14, weight: .semibold))
                            
                        }
                        .foregroundStyle(.c3ProgressForeground)
                        
                        MainProgressBar(value: $progressValue)
                    }
                    .padding(.top, 14)
                    
                    
                    Spacer()
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())]) {
                        MainButton(type: .study, action: {
                            Task {
                                await viewModel.loadStudyMission()
                                if let mission = viewModel.studyMission {
                                    router.push(.studyMission(mission))
                                }
                            }
                        }, iconName: "main_pencil_icon")
                        .frame(height: 175)
                        
                        MainButton(type: .exercise, action: {
                            Task {
                                await viewModel.loadExerciseMissions()
                                
                                if let missions = viewModel.exerciseMissions {
                                    router.push(.exerciseMission(missions))
                                }
                            }
                        }, iconName: "main_health_icon")
                        .frame(height: 175)
                    }
                    .padding(.top, 30)
                }
                
                .padding(24)
                
            }
            //            .background(.c3MainBackground)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .studyMission(let mission):
                    StudyMissionView(mission: mission)
                case .exerciseMission(let missions):
                    ExerciseMissionView(missions: missions)
                case .missionList:
                    MissionListView()
                case .studyMissionWrite(let mission):
                        CreateAnswerView(mission: mission)
                case .studyMissionComplete(let mission, let userAnswer):
                        StudyMissionCompleteView(mission: mission, userAnswer: userAnswer)
                    
                }
            }
        }
        .onAppear {
            print("MainView onAppear 실행됨")
            
            Task {
                await userViewModel.loadUserDailyInfo()
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    progressValue = userViewModel.progress
                }
                startValue = userViewModel.progress
            }
            
        }
        .onChange(of: router.path) {
            // 루트로 돌아왔을 때만 새로 불러오기
            if router.path.isEmpty {
                Task {
                    await userViewModel.loadUserDailyInfo()
                    
                    progressValue = startValue
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                        progressValue = userViewModel.progress
                    }
                    let options = ["sleeping", "hello", "crying"]
                    if let randomName = options.randomElement() {
                        withAnimation {
                            lottieAnimationName = randomName
                            print("🎲 랜덤 로띠: \(randomName)")
                        }
                    }
                }
            }
        }
        
    }
    
}


#Preview {
    MainView()
        .environmentObject(Router())
}
