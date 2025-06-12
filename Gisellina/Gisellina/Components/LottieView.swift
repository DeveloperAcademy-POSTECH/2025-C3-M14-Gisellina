//
//  LottieView.swift
//  Gisellina
//
//  Created by Jamin on 6/11/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop

    class Coordinator {
        let animationView = LottieAnimationView()
        var currentAnimationName: String?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let animationView = context.coordinator.animationView

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // 초기 설정
        context.coordinator.currentAnimationName = animationName
        animationView.animation = LottieAnimation.named(animationName)
        animationView.play()

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        let coordinator = context.coordinator
        let animationView = coordinator.animationView

        if coordinator.currentAnimationName != animationName {
            coordinator.currentAnimationName = animationName
            animationView.animation = LottieAnimation.named(animationName)
            animationView.play()
        }
    }
}
