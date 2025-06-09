//
//  GisellinaApp.swift
//  Gisellina
//
//  Created by Jamin on 5/26/25.
//

import SwiftUI

@main
struct GisellinaApp: App {
    @StateObject private var router = Router()
    init() {
        Task {
            await UserService.registerIfNeeded()
        }
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(router)
        }
    }
}
