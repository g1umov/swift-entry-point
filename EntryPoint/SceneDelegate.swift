//
//  SceneDelegate.swift
//  EntryPoint
//
//  Created by Vladislav Glumov on 13.6.24..
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let counter = UserInteractionsCounter()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController(counter: counter)

        counter.delegate = viewController

        window.rootViewController = viewController
        window.makeKeyAndVisible()

        self.window = window
    }
}
