//
//  ExerciseMisiionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionListView: View {
    @EnvironmentObject var router: Router
    
    let missions: [MissionList]
    
    var body: some View {
        VStack(spacing: 0){
            CustomNavigationBar(
                title: "컨디션 점검",
                titleColor: .black,    // ← 제목 텍스트 색상
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
                    VStack{
                        Text("사전 검토하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.blue)
                            .opacity(0.5)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
//                    .background(.blue)
                    VStack{
                        Text("사전 검토하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.blue)
                            .opacity(1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
//                    .background(.red)
                }
                .padding(.top, 12)
                HStack(spacing: 0){
                    VStack{}
                        .frame(maxWidth: .infinity, minHeight: 4)
                        .background(Color.blue.opacity(0.5))
                    VStack{}
                        .frame(maxWidth: .infinity, minHeight: 4)
                        .background(Color.blue.opacity(1))
                }
            }
            
            ScrollView{
                VStack(spacing: 14) {
                    ForEach(missions.indices, id: \.self) { index in
                        ExerciseMissionListRowView(missionDetail: missions[index])
                    }
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 20)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
}

//
//#Preview {
//    ExerciseMissionListView()
//}
