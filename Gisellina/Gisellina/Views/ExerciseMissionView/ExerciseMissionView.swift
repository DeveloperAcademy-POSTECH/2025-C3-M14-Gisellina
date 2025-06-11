//
//  ExerciseMissionView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionView: View {
    let client = SupabaseManager.shared.client
    @State var missions: [ExerciseMissionDetail]
    @State private var completedMissions: Set<UUID> = []
    @EnvironmentObject var router: Router
    
    
    var safeAreaTop: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 20 // 기본값 20 (예: iPhone SE)
    }
    
    var completedCount: Int {
        missions.filter { $0.isDone || completedMissions.contains($0.id) }.count
    }
    
    var body: some View {
        ZStack {
            Image("ExerciseMissionView_background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            
            VStack(spacing: 12){
                CustomNavigationBar(
                    title: "컨디션 점검",
                    titleColor: .white,    // ← 제목 텍스트 색상
                    leftItem: AnyView(
                        NavigationIconButton(
                            action: { router.pop() },
                            iconName: "chevron.left",
                            iconColor: .white     // ← 아이콘 색상
                        )
                    )
                )
            
                    Image("clear\(completedCount)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                
                
                VStack(alignment: .leading, spacing: 14) {
                    VStack{
                        HStack{
                            Text("건강 관리도 필수!")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
//                        .padding(.top, 20)
                        ScrollView(showsIndicators: false) {
                            ForEach(missions) { mission in
                                let isMissionDone = mission.isDone || completedMissions.contains(mission.id)
                                ExerciseMissionCardView(
                                    title: mission.title,
                                    mission: mission.exerciseBody,
                                    isDone: isMissionDone,
                                    onComplete: {
                                        guard !completedMissions.contains(mission.id) else {
                                            print("⚠️ 이미 완료된 미션이라 스킵: \(mission.id)")
                                            return }
                                        
                                        print("🔵 RPC 실행 시작: \(mission.userId) / \(mission.id)")
                                        Task {
                                            do {
                                                try await client.rpc("confirm_mission", params: [
                                                    "p_user_id": mission.userId.uuidString,
                                                    "p_detail_id": mission.id.uuidString
                                                ])
                                                .execute()
                                                print("✅ RPC 성공, 완료됨")
                                                completedMissions.insert(mission.id) // UI 업데이트
                                                self.missions = try await MissionService.fetchAllExerciseMissions()
                                            } catch {
                                                print("❌ 완료 실패: \(error)")
                                            }
                                        }
                                    }
                                    
                                )
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
    //    #Preview {
    //        ExerciseMissionView(missions: [])
    //    }
