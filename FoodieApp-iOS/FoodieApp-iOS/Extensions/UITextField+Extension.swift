//
//  UITextField+Extension.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit

extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        button.setImage(isSecureTextEntry ? Icon.eyeOpen : Icon.eyeClose, for: .normal)
    }

    func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)

        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -30,
            bottom: 0,
            right: 0
        )

        button.frame = CGRect(
            x: CGFloat(self.frame.size.width - 22),
            y: CGFloat(5),
            width: CGFloat(22),
            height: CGFloat(22)
        )

        button.addTarget(
            self,
            action: #selector(self.togglePasswordView),
            for: .touchUpInside
        )

        self.rightView = button
        self.rightViewMode = .always
    }

    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry

        if let sender = sender as? UIButton {
            setPasswordToggleImage(sender)
        }
    }
}
