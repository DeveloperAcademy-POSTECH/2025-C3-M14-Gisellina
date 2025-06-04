//
//  ExerciseMissionView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct ExerciseMissionView: View {
    @EnvironmentObject var router: Router
    
    var safeAreaTop: CGFloat {
            UIApplication.shared.connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
                .first ?? 20 // 기본값 20 (예: iPhone SE)
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
                
                HStack(alignment: .top) {
                    Image("CharacterImage")
                        .resizable()
                        .scaledToFit()
                    ZStack{
                        Image("Talking")
                        Text("오늘도 한단계 성장했어요!")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.blue)
                    }
                }
                
                VStack(alignment: .leading, spacing: 14) {
                    HStack{
                        Text("건강 관리도 필수!")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 4) {
                            Text("아침을 상괘하게 시작")
                            Text("5분 스트레칭")
                                .font(.system(size: 20, weight: .bold))
                        }
                        Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.blue .opacity(0.5))
                    }
                    .padding(24)
//                    .background(Color.red)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                    )
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 4) {
                            Text("아침을 상괘하게 시작")
                            Text("5분 스트레칭")
                                .font(.system(size: 20, weight: .bold))
                        }
                        Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.blue .opacity(0.5))
                    }
                    .padding(24)
//                    .background(Color.red)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                    )
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 4) {
                            Text("아침을 상괘하게 시작")
                            Text("5분 스트레칭")
                                .font(.system(size: 20, weight: .bold))
                        }
                        Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.blue .opacity(0.5))
                    }
                    .padding(24)
//                    .background(Color.red)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                    )
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 4) {
                            Text("아침을 상괘하게 시작")
                            Text("5분 스트레칭")
                                .font(.system(size: 20, weight: .bold))
                        }
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.blue .opacity(0.8))
//                        Image(systemName: "checkmark.circle")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .foregroundStyle(.blue .opacity(0.5))
                    }
                    .padding(24)
                    .background(Color.blue .opacity(0.1))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                    )
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExerciseMissionView()
}
