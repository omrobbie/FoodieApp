//
//  BasketViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 15/11/20.
//

import UIKit

class BasketViewController: UIViewController {

    @IBOutlet weak var headerBox: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerBox: UIView!

    private let headerCellHeight: CGFloat = 41

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTableView()
        setupFooter()
    }

    private func setupHeader() {
        headerBox.withShadow()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = headerCellHeight

        tableView.register(
            UINib(nibName: CellName.basketDeliverCell, bundle: nil),
            forCellReuseIdentifier: CellName.basketDeliverCell
        )

        tableView.register(
            UINib(nibName: CellName.basketOrderCell, bundle: nil),
            forCellReuseIdentifier: CellName.basketOrderCell
        )

        tableView.register(
            UINib(nibName: CellName.basketOrderTotalCell, bundle: nil),
            forCellReuseIdentifier: CellName.basketOrderTotalCell
        )

        tableView.register(
            UINib(nibName: CellName.basketPaymentCell, bundle: nil),
            forCellReuseIdentifier: CellName.basketPaymentCell
        )
    }

    private func setupFooter() {
        footerBox.withShadow(shadowUpSide: true)
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        dismissDetail()
    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: tableView.frame.width,
            height: headerCellHeight
        ))

        if #available(iOS 13.0, *) {
            headerView.backgroundColor = UIColor.systemGray6
        } else {
            headerView.backgroundColor = UIColor.lightGray
        }

        let label = UILabel(frame: CGRect(
            x: 28,
            y: 0,
            width: tableView.frame.width,
            height: headerCellHeight
        ))
        label.font = UIFont(name: FontPoppins.semiBold, size: 18)
        label.textColor = Color.headerCellText
        headerView.addSubview(label)

        switch section {
        case 0:
            label.text = "Deliver to"
        case 1:
            label.text = "Order Summary"
        case 2:
            label.text = "Payment Details"
        default:
            label.text = ""
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1 + 1
        case 2:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?

        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.basketDeliverCell)
        case 1:
            if indexPath.count - 1 == indexPath.row {
                cell = tableView.dequeueReusableCell(withIdentifier: CellName.basketOrderTotalCell)
            } else {
                cell = tableView.dequeueReusableCell(withIdentifier: CellName.basketOrderCell)
            }
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.basketPaymentCell)
        default:
            cell = UITableViewCell()
        }

        if let cell = cell {
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
