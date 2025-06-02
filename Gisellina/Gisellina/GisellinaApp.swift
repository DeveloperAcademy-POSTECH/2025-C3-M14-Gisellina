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
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(router)
        }
    }
}
