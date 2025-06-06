//
//  StudyMissionListView.swift
//  Gisellina
//
//  Created by Noah on 6/2/25.
//

import SwiftUI

struct StudyMissionListView: View {
    var body: some View {
        VStack(spacing: 0){
            HStack(alignment: .center){
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
            }
//            .background(.red)
            .padding(.horizontal, 20)
            
            VStack(spacing: 0){
                HStack(spacing: 0){
                    VStack{
                        Text("사전 검토하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.blue)
                            .opacity(1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
//                    .background(.blue)
                    VStack{
                        Text("사전 검토하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.blue)
                            .opacity(0.5)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
//                    .background(.red)
                }
                .padding(.top, 12)
                HStack(spacing: 0){
                    VStack{}
                        .frame(maxWidth: .infinity, minHeight: 4)
                        .background(Color.blue.opacity(1))
                    VStack{}
                        .frame(maxWidth: .infinity, minHeight: 4)
                        .background(Color.blue.opacity(0.4))
                }
            }
            
            ScrollView{
                VStack(spacing: 14){
                    StudyMissionListCell()
                        .padding(.top, 20)
                    StudyMissionListCell()
                    StudyMissionListCell()
                    StudyMissionListCell()
                    StudyMissionListCell()
                    StudyMissionListCell()
                }
            }
            .padding(.horizontal, 20)
//            .background(.red)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct StudyMissionListCell: View {
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 4) {
                Text("2025.06.01")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray)
                Text("Q. 증여자가 수증기의 범죄행위를 원인으로 하여 증여계약을 수증자가 그...")
                    .font(.system(size: 16, weight: .bold))
            }
            Spacer()
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
            Image(systemName: "chevron.right")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.blue .opacity(0.5))
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
    StudyMissionListView()
}
