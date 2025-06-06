//
//  MainViewModel.swift
//  Gisellina
//
//  Created by Jamin on 6/4/25.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?

    //Users 불러오기
    func fetchUsers() async {
        do {
            let result = try await UserService.fetchUsers()
            self.users = result
            print("유저 불러오기 성공: \(result.count)명")
        } catch {
            self.errorMessage = error.localizedDescription
            print("유저 불러오기 실패: \(error.localizedDescription)")
        }
    }
    
    //Users row 추가
    func addUser(name: String, exp: Int = 0, vacation: Int = 5) async {
        do {
            try await UserService.addUser(name: name, exp: exp, vacation: vacation)
            print("유저 추가 성공")
        } catch {
            self.errorMessage = error.localizedDescription
            print("유저 추가 실패: \(error.localizedDescription)")
        }
    }}
