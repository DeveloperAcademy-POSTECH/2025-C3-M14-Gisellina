//
//  AppRoute.swift
//  Gisellina
//
//  Created by Jamin on 6/2/25.
//


//MARK: - 우리가 갈 수 있는 목적지 모음
enum AppRoute: Hashable {
    case missionList
    case studyMission(StudyMissionDetail)
    case exerciseMission([ExerciseMissionDetail])
    case studyMissionWrite(StudyMissionDetail)
    case studyMissionComplete(mission: StudyMissionDetail, userAnswer: String)
    

}
