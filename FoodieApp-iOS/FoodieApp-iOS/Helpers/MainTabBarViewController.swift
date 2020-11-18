//
//  MainTabBarViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 14/11/20.
//

import UIKit

struct TabBar {
    static func viewController() -> UIViewController {
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [
            homeVC(),
            myOrderVC(),
            accountVC()
        ]

        tabBarVC.tabBar.tintColor = Color.primary
        return tabBarVC
    }

    static private func homeVC() -> UIViewController {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: Icon.home,
            tag: 1
        )

        return homeVC
    }

    static private func myOrderVC() -> UIViewController {
        let myOrderVC = MyOrderViewController()
        myOrderVC.tabBarItem = UITabBarItem(
            title: "My Order",
            image: Icon.myOrder,
            tag: 2
        )

        return myOrderVC
    }

    static private func accountVC() -> UIViewController {
        let accountVC = ProfileViewController()
        accountVC.tabBarItem = UITabBarItem(
            title: "Account",
            image: Icon.account,
            tag: 3
        )

        return accountVC
    }
}
