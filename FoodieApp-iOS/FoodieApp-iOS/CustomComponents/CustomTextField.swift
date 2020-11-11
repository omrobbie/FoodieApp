//
//  CustomTextField.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    private let padding = UIEdgeInsets(top: 13, left: 19, bottom: 13, right: 19)

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    private func setupUI() {
        font = UIFont(name: FontPoppins.regular, size: 16)
        heightAnchor.constraint(equalToConstant: 49).isActive = true
        layer.cornerRadius = 5
        backgroundColor = Color.textField
        borderStyle = .none
    }
}
