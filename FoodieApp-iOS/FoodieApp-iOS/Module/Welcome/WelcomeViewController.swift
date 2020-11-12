//
//  ViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 11/11/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnLoginTapped(_ sender: Any) {
        let loginVC = LoginViewController()

        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }

    @IBAction func btnCreateAccountTapped(_ sender: Any) {
        let createAccountVC = CreateAccountViewController()

        createAccountVC.modalPresentationStyle = .fullScreen
        present(createAccountVC, animated: true)
    }
}
