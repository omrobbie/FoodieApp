//
//  CustomView.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 15/11/20.
//

import UIKit

@IBDesignable
class CustomView: UIView {

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
