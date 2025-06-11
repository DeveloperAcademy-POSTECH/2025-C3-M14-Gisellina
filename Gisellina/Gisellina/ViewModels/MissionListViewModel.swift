//
//  MissionListViewModel.swift
//  Gisellina
//
//  Created by Noah on 6/11/25.
//

import Foundation

@MainActor
final class MissionListViewModel: ObservableObject {
    @Published var missions: [MissionList] = []
    @Published var errorMessage: String?
}
