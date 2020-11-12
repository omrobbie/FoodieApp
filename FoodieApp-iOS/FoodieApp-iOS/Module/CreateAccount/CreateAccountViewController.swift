//
//  CreateAccountViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit
import CountryPickerView

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var txtPhoneCode: CountryPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryPickerView()
    }

    private func setupCountryPickerView() {
        txtPhoneCode.delegate = self
        txtPhoneCode.dataSource = self
        txtPhoneCode.showCountryCodeInView = false
        txtPhoneCode.layer.cornerRadius = 5
        txtPhoneCode.backgroundColor = Color.textField
        txtPhoneCode.bounds = CGRect().inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension CreateAccountViewController: CountryPickerViewDelegate, CountryPickerViewDataSource {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print(country)
    }
}
