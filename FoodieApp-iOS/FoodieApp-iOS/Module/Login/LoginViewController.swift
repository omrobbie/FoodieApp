//
//  LoginViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.enablePasswordToggle()
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
