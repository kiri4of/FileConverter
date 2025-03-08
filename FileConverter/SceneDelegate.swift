//
//  SceneDelegate.swift
//  FileConverter
//
//  Created by Kiri4of on 08/03/2025.
//

import UIKit
import SwiftUI
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .light
        
        let mainVC = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        window?.makeKeyAndVisible()
        
        //if isFirstLaunch() {
            showOnboarding()
        //}
    }
    
    private func isFirstLaunch() -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore {
            return false
        } else {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            return true
        }
    }
    
    func showOnboarding() {
        let viewModel = OnboardingViewModel()
        viewModel.onFinish = { [weak self] in
            self?.finishOnboarding()
        }
        
        let onboardingView = OnboardingView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: onboardingView)
        hostingController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController?.present(hostingController, animated: true)
    }
    
    private func finishOnboarding() {
        window?.rootViewController?.dismiss(animated: true)
    }


}

