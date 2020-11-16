//
//  CustomTextView.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 17/11/20.
//

import UIKit

@IBDesignable
class CustomTextView: UITextView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        font = UIFont(name: FontPoppins.regular, size: 16)
        heightAnchor.constraint(equalToConstant: 49).isActive = true
        layer.cornerRadius = 5
        backgroundColor = Color.textField
    }
}
