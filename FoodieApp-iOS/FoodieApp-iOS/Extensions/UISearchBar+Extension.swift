//
//  UISearchBar+Extension.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 13/11/20.
//

import UIKit

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap {$0.subviews}
        guard let textField = (subViews.filter {$0 is UITextField}).first as? UITextField else {return nil}
        return textField
    }
}
