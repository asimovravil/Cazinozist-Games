//
//  SceneDelegate.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = CazinozistViewController()
        window?.makeKeyAndVisible()
    
        CazinozistBurger.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = CazinozistWebViewController(url: url)
            } else {
                if !CazinozistData.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: OnboardingViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}
