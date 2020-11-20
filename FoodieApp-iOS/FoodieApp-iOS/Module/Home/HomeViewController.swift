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

    private var model: [KitchenModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupSearchBar()
        setupFilters()
        setupTableView()

        loadData()
    }

    private func loadData() {
        let remote = RemoteDataSourceImpl.shared
        let repo = KitchenRepositoryImpl.shared(remote)
        let useCase = HomeUseCaseImpl(repository: repo)

        useCase.getKitchens { response in
            switch response {
            case .success(let value):
                self.model = value
                self.tableView.reloadData()
            case .failure(let error):
                print(error.errorDescription)
            }
        }
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
            UINib(nibName: CellName.homeCell, bundle: nil),
            forCellReuseIdentifier: CellName.homeCell
        )
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellName.homeCell) as? HomeTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let kitchenDetailVC = KitchenDetailViewController()
        kitchenDetailVC.modalPresentationStyle = .fullScreen
        presentDetail(kitchenDetailVC)
    }
}
