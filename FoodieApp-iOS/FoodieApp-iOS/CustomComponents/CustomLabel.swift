//
//  CustomLabel.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 11/11/20.
//

import UIKit

@IBDesignable
class CustomLabel: UILabel {

    @IBInspectable
    var primaryText: String = ""

    @IBInspectable
    var highlightedText: String = ""

    @IBInspectable
    var highlightedColor: UIColor?

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        let range = (primaryText as NSString).range(of: highlightedText)
        let mutableAttributedString = NSMutableAttributedString(string: primaryText)
        mutableAttributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: highlightedColor ?? Color.primary,
            range: range
        )

        font = UIFont(name: FontPoppins.semiBold, size: 32)
        attributedText = mutableAttributedString
    }
}
