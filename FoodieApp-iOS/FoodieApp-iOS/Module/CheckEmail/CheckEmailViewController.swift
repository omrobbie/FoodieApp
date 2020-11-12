//
//  CheckEmailViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit

class CheckEmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnCloseTapped(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
}
