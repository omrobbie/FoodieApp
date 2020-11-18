//
//  ProfileViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 18/11/20.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnEditTapped(_ sender: Any) {
        let profileEditVC = ProfileEditViewController()
        profileEditVC.modalPresentationStyle = .fullScreen
        presentDetail(profileEditVC)
    }
}
