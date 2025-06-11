//
//  ExerciseMissionCardView.swift
//  Gisellina
//
//  Created by Jamin on 6/11/25.
//
import Foundation
import SwiftUI

struct ExerciseMissionCardView: View {
    let title: String
    let mission: String
    let isDone: Bool
    let onComplete: () -> Void 
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                Text(mission)
                    .font(.system(size: 20, weight: .bold))
            }
            Spacer()
            Image(systemName: isDone ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .opacity(isDone ? 0.5 : 1.0)
                .foregroundStyle(.blue.opacity(isDone ? 0.8 : 0.5))
                .onTapGesture {
                    if !isDone {
                        onComplete()
                    }
                }
            
        }
        .padding(24)
        .background(isDone ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
        )
    }
}
