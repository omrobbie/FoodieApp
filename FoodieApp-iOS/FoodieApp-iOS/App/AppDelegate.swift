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

        let homeVC = HomeViewController()
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()

        return true
    }
}
