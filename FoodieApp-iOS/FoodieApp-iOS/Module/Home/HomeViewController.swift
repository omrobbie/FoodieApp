//
//  HomeViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 12/11/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerBox: UIView!
    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var sgmFilters: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupSearchBar()
        setupFilters()
        setupTableView()
    }

    private func setupHeader() {
        headerBox.withShadow()
    }

    private func setupSearchBar() {
        txtSearch.textField?.font = UIFont(name: FontPoppins.regular, size: 16)
    }

    private func setupFilters() {
        if #available(iOS 13.0, *) {
            sgmFilters.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.systemBackground],
                for: .selected
            )
        } else {
            sgmFilters.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.white],
                for: .selected
            )
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

        tableView.register(
            UINib(nibName: "HomeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "home"
        )
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "home") as? HomeTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}