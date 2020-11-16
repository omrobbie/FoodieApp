//
//  MyOrderViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 16/11/20.
//

import UIKit

class MyOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none

        tableView.register(
            UINib(nibName: CellName.myOrderCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderCell
        )
    }
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderCell)

        if let cell = cell {
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let myOrderDetailVC = MyOrderDetailViewController()
        myOrderDetailVC.modalPresentationStyle = .fullScreen
        presentDetail(myOrderDetailVC)
    }
}
