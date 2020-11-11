//
//  CustomButton.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 11/11/20.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable
    var borderOnly: Bool = false

    @IBInspectable
    var primaryColor: UIColor = Color.primary

    @IBInspectable
    var secondaryColor: UIColor = UIColor.white

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        titleLabel?.font = UIFont(name: FontPoppins.semiBold, size: 18)
        heightAnchor.constraint(equalToConstant: 56).isActive = true
        layer.cornerRadius = 5.0

        if borderOnly {
            layer.borderWidth = 1
            layer.borderColor = primaryColor.cgColor
            tintColor = primaryColor
        } else {
            backgroundColor = primaryColor
            tintColor = secondaryColor
        }
    }
}
