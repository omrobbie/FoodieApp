//
//  FoodDetailViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 15/11/20.
//

import UIKit
import GMStepper

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var viewBasket: UIView!
    @IBOutlet weak var stepper: GMStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBasketBox()
        setupStepper()
    }

    private func setupViewBasketBox() {
        viewBasket.withShadow(shadowUpSide: true)
    }

    private func setupStepper() {
        stepper.buttonsTextColor = Color.primary

        if #available(iOS 13.0, *) {
            stepper.buttonsBackgroundColor = UIColor.systemGray5
        } else {
            stepper.buttonsBackgroundColor = UIColor.gray
        }

        if let font = UIFont(name: FontPoppins.semiBold, size: 20) {
            stepper.labelFont = font
        }

        if #available(iOS 13.0, *) {
            stepper.labelTextColor = UIColor.label
        } else {
            stepper.labelTextColor = UIColor.black
        }

        if #available(iOS 13.0, *) {
            stepper.labelBackgroundColor = UIColor.systemGray6
        } else {
            stepper.labelBackgroundColor = UIColor.lightGray
        }

        if #available(iOS 13.0, *) {
            stepper.limitHitAnimationColor = UIColor.systemGray4
        } else {
            stepper.limitHitAnimationColor = UIColor.darkGray
        }
    }

    @IBAction func btnCloseTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func btnAddToBasketTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
