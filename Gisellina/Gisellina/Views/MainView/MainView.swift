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
    @State private var progressValue: CGFloat = 0
    @State private var startValue: CGFloat = 0

    @State private var isLoaded = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                VStack() {
                    HStack {
                        Spacer()
                        
                        Image(.missionListIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .onTapGesture {
                                router.push(.missionList)
                            }
                    }
                    
                    HeaderNoticeView()
                    
                    Text("보유 월차: \(userViewModel.vacation)")
                    
                    Image(.mainCharacterImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 60)
                    
                    VStack {
                        MainProgressBar(value: $progressValue)
                        HStack {
                            Text("Lv.\(userViewModel.level)")
                            Spacer()
                            Text("Lv.\(userViewModel.level+1)")
                        }
                        .foregroundStyle(.c3ProgressBackground)
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
                        })
                        .frame(height: 175)
                        
                        MainButton(type: .exercise, action: {
                            Task {
                                await viewModel.loadExerciseMissions()
                                
                                if let missions = viewModel.exerciseMissions {
                                    router.push(.exerciseMission(missions))
                                }
                            }
                        })
                        .frame(height: 175)
                    }
                    .padding(.top, 30)
                }
                
                .padding(24)
                
            }
            .background(.c3MainBackground)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .studyMission(let mission):
                    StudyMissionView(mission: mission)
                case .exerciseMission(let missions):
                    ExerciseMissionView(missions: missions)  //수정 필요
                case .missionList:
                    StudyMissionListView()
                    
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
                }
            }
        }

    }
    
}

#Preview {
    MainView()
        .environmentObject(Router())
}
