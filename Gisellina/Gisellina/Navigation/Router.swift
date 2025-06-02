//
//  Router.swift
//  Gisellina
//
//  Created by Jamin on 6/2/25.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    // 다음 화면을 Push
    // route에는 AppRoute에서 설정한 목적지들이 들어감
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    // 이 전 화면으로 Pop
    func pop() {
        path.removeLast()
    }
    
    // 초기 화면으로 모든 Stack Pop
    func popToRoot() {
        path.removeLast(path.count)
    }
}
