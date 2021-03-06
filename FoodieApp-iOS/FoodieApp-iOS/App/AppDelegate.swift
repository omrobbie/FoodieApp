//
//  AppDelegate.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 11/11/20.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeVC = storyboard.instantiateViewController(
            withIdentifier: NibName.welcomeVC
        ) as? WelcomeViewController

        let currentLocationVC = CurrentLocationViewController()
        currentLocationVC.modalPresentationStyle = .fullScreen

        let isLoggedIn = true // TODO: Check from UserDefaults

        window?.rootViewController = isLoggedIn ? currentLocationVC : welcomeVC
        window?.makeKeyAndVisible()

        return true
    }
}
