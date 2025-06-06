//
//  ExerciseMisiionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionListView: View {
    @EnvironmentObject var router: Router
    
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
                VStack(spacing: 14){
                    ExerciseMissionListCell()
                        .padding(.top, 20)
                    ExerciseMissionListCell()
                    ExerciseMissionListCell()
                    ExerciseMissionListCell()
                    ExerciseMissionListCell()
                    ExerciseMissionListCell()
                    ExerciseMissionListCell()
                }
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ExerciseMissionListCell: View {
    var body: some View {
        HStack(spacing: 10){
            Image("CharacterImage")
                .frame(width: 40, height: 40)
                .padding(4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("2025.06.01")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                Text("스트레칭 | 산책하기 | 러닝")
                    .font(.system(size: 18, weight: .bold))
            }
            Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
        }
        .padding(24)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
            )
    }
}


#Preview {
    ExerciseMissionListView()
}
