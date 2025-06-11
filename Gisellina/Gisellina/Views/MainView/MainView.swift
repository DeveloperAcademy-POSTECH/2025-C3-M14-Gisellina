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
    
    @State var progressValue: CGFloat = 0.8
    @State var vacation = 5
    @State var level = 1
    
    @State private var isLoaded = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                Image("MainView_background")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                
                VStack() {
                    HStack {
                        Spacer()
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
                    
                    Text("보유 월차: \(vacation)")
                    
                    Image(.mainCharacterImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 60)
                    
                    VStack {
                        MainProgressBar(value: $progressValue)
                        HStack {
                            Text("Lv.\(level)")
                            Spacer()
                            Text("Lv.\(level+1)")
                        }
                        .foregroundStyle(.c3ProgressForeground)
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
                    ExerciseMissionView(missions: missions)  //수정 필요
                case .missionList:
                    StudyMissionListView()
                    
                }
            }
        }
        .onAppear {
            print("MainView onAppear 실행됨")
        }
    }
    
}

#Preview {
    MainView()
        .environmentObject(Router())
}
