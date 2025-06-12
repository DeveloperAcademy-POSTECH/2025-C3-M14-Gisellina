//
//  MissionListView.swift
//  Gisellina
//
//  Created by Noah on 6/11/25.
//

import SwiftUI

enum MissionTabType {
    case study
    case exercise
}

struct MissionListView: View {
    @State private var selectedTab: MissionTabType = .study
    @EnvironmentObject var router: Router
    @StateObject private var missionViewModel = MissionViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            CustomNavigationBar(
                title: "컨디션 점검",
                titleColor: .white,    // ← 제목 텍스트 색상
                leftItem: AnyView(
                    NavigationIconButton(
                        action: { router.pop() },
                        iconName: "chevron.left",
                        iconColor: .black     // ← 아이콘 색상
                    )
                )
            )
            .padding(.horizontal, 24)
            
            VStack(spacing: 0){
                HStack(spacing: 0){
                    tabButton(title: "사건 검토하기", isSelected: selectedTab == .study) {
                        selectedTab = .study
                    }
                    tabButton(title: "컨디션 점검하기", isSelected: selectedTab == .exercise) {
                        selectedTab = .exercise
                    }
                }
                .padding(.top, 12)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.blue.opacity(selectedTab == .study ? 1 : 0.4))
                        .frame(maxWidth: .infinity, maxHeight: 4)
                    Rectangle()
                        .fill(Color.blue.opacity(selectedTab == .exercise ? 1 : 0.4))
                        .frame(maxWidth: .infinity, maxHeight: 4)
                }
            }
            
            
                if selectedTab == .study {
                    StudyMissionListView(missionList: missionViewModel.studyDoneMissions ?? [])
                } else {
                    ExerciseMissionListView(missionList: missionViewModel.groupedExerciseDoneMissions)
                }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .bottom)
        .onAppear() {
            print("MissionList onAppear 실행됨")
            
            Task {
                await missionViewModel.loadDoneExerciseMissions()
                await missionViewModel.loadDoneStudyMissions()
            }
        }
    }
    
    
    @ViewBuilder
        func tabButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
            VStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.blue)
                    .opacity(isSelected ? 1 : 0.5)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .onTapGesture(perform: action)
        }
}



#Preview {
    MissionListView()
}
