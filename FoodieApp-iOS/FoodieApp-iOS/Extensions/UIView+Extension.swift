//
//  UIView+Extension.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 13/11/20.
//

import UIKit

extension UIView {
    func withShadow(shadowUpSide: Bool = false) {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4

        layer.shadowOffset = CGSize(
            width: 0,
            height: shadowUpSide ? -8 : 8
        )

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
