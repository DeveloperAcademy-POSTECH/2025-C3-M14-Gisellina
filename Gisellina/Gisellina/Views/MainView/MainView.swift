//
//  MainView.swift
//  Gisellina
//
//  Created by Jamin on 5/28/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        @State var progressValue: CGFloat = 0.8
        @State var vacation = 5
        @State var level = 1
        
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
                        .foregroundStyle(.c3ProgressBackground)
                    }
                    .padding(.top, 14)
                    
                    
                    Spacer()
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())]) {
                        MainButton(type: .study, action: {
                            router.push(.studyMission)
                        })
                            .frame(height: 175)
                        
                        MainButton(type: .exercise, action: {
                            router.push(.exerciseMission)
                        })
                            .frame(height: 175)
                    }
                }
                
                .padding(24)
                
            }
            .background(.c3MainBackground)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .studyMission:
                    StudyMissionView()
                case .exerciseMission:
                    ContentView()  //수정 필요
                case .missionList:
                    ContentView()
                    
                }
            }
        }
    }
    
}

#Preview {
    MainView()
        .environmentObject(Router())
}
