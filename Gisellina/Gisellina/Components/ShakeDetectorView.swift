//
//  ShakeDetectorView.swift
//  Gisellina
//
//  Created by Jamin on 6/12/25.
//

import SwiftUI
import UIKit

struct ShakeDetectorView: UIViewControllerRepresentable {
    var onShake: () -> Void

    func makeUIViewController(context: Context) -> ShakeViewController {
        let controller = ShakeViewController()
        controller.onShake = onShake
        return controller
    }

    func updateUIViewController(_ uiViewController: ShakeViewController, context: Context) {}
}

class ShakeViewController: UIViewController {
    var onShake: (() -> Void)?

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("📱 흔들림 감지됨!")
            onShake?()
        }
    }
}
