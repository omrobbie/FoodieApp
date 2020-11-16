//
//  FeedbackViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 16/11/20.
//

import UIKit

class FeedbackViewController: BottomSheetViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewHeight = 550
    }

    @IBAction func btnCloseTapped(_ sender: Any) {
        removeFromSuperview()
    }
}
