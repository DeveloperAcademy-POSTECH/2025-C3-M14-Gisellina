//
//  MissionViewModel.swift
//  Gisellina
//
//  Created by Jamin on 6/5/25.
//

import Foundation

@MainActor
final class MissionViewModel: ObservableObject {
    @Published var studyMission: StudyMissionDetail?
    @Published var exerciseMissions: [ExerciseMissionDetail]?
    @Published var errorMessage: String?
    
    func loadStudyMission() async {
        do {
            studyMission = try await MissionService.fetchOneStudyMission()
            print("📦 랜덤 study 미션 가져옴: \(studyMission!)")

        } catch {
            errorMessage = error.localizedDescription
            print("❌ Study 미션 로드 실패: \(error)")
        }
    }

    func loadExerciseMissions() async {
        do {
            exerciseMissions = try await MissionService.fetchAllExerciseMissions()
            print("📦 exercise 미션들 가져옴: \(exerciseMissions ?? [])")
        } catch {
            errorMessage = error.localizedDescription
            print("❌ exercise 미션 로드 실패: \(error)")
        }
    }
}
