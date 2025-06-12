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
    @Published var exerciseDoneMissions: [MissionList]?
    @Published var studyDoneMissions: [MissionList]?
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
    
    func loadDoneExerciseMissions() async {
        do {
            let all = try await MissionListService.fetchDoneMissions()
            self.exerciseDoneMissions = all.filter { $0.mission == "exercise" }
        } catch {
            errorMessage = error.localizedDescription
            print("❌ exerciseDone 미션 로드 실패: \(error)")
        }
    }
    
    func loadDoneStudyMissions() async {
        do {
            let all = try await MissionListService.fetchDoneMissions()
            self.studyDoneMissions = all.filter { $0.mission == "study" }
        } catch {
            errorMessage = error.localizedDescription
            print("❌ study 미션 로드 실패: \(error)")
        }
    }
}


struct GroupedMissionList: Identifiable {
    let id = UUID()
    let date: String
    let missions: [MissionList]
}

extension MissionViewModel {
    var groupedExerciseDoneMissions: [GroupedMissionList] {
        guard let done = exerciseDoneMissions else { return [] }

        let groupedDict = Dictionary(grouping: done) { mission in
            String(mission.createdAt.prefix(10)) // "2025-06-11T..." → "2025-06-11"
        }

        return groupedDict
            .map { GroupedMissionList(date: $0.key, missions: $0.value) }
            .sorted { $0.date > $1.date } // 최신 날짜 먼저
    }
}
