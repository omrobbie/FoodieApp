//
//  CustomButtonSmall.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 13/11/20.
//

import UIKit

@IBDesignable
class CustomButtonSmall: UIButton {

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
        titleLabel?.font = UIFont(name: FontPoppins.medium, size: 12)
        heightAnchor.constraint(equalToConstant: 31).isActive = true
        layer.cornerRadius = 5.0

        if borderOnly {
            layer.borderWidth = 1
            layer.borderColor = Color.border.cgColor

            if #available(iOS 13.0, *) {
                tintColor = .label
            } else {
                tintColor = .black
            }
        } else {
            backgroundColor = primaryColor
            tintColor = secondaryColor
        }
    }
}
