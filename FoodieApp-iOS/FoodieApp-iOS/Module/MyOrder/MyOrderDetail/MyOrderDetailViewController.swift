//
//  MyOrderDetailViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 16/11/20.
//

import UIKit

class MyOrderDetailViewController: UIViewController {

    @IBOutlet weak var headerBox: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerBox: UIView!

    private let headerCellHeight: CGFloat = 41

    private var bottomSheet = FeedbackViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTableView()
        setupFooter()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }

    private func setupHeader() {
        headerBox.withShadow()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = headerCellHeight

        tableView.register(
            UINib(nibName: CellName.myOrderDeliverCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderDeliverCell
        )

        tableView.register(
            UINib(nibName: CellName.myOrderLocationCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderLocationCell
        )

        tableView.register(
            UINib(nibName: CellName.myOrderSummaryCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderSummaryCell
        )

        tableView.register(
            UINib(nibName: CellName.myOrderSummaryDetailCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderSummaryDetailCell
        )

        tableView.register(
            UINib(nibName: CellName.myOrderSubtotalCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderSubtotalCell
        )

        tableView.register(
            UINib(nibName: CellName.myOrderTotalCell, bundle: nil),
            forCellReuseIdentifier: CellName.myOrderTotalCell
        )
    }

    private func setupFooter() {
        footerBox.withShadow(shadowUpSide: true)
    }

    private func showBottomSheet() {
        bottomSheet.bringToFront(self)
    }

    @IBAction func btnContactTapped(_ sender: Any) {
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        dismissDetail()
    }
}

extension MyOrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
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

        if section == 0 {
            let stackView = UIStackView(frame: CGRect(
                x: 28,
                y: 0,
                width: tableView.frame.width - (28 * 2),
                height: headerCellHeight
            ))

            let label1 = UILabel(frame: CGRect(x: 0, y: 15, width: tableView.frame.width, height: 10))
            label1.font = UIFont(name: FontPoppins.medium, size: 14)
            label1.text = "Booking ID"
            label1.textColor = Color.headerCellText
            stackView.addArrangedSubview(label1)

            let label2 = UILabel(frame: CGRect(x: 0, y: 15, width: tableView.frame.width, height: 10))
            label2.font = UIFont(name: FontPoppins.medium, size: 14)
            label2.text = "AMD-23-340092"
            label2.textColor = Color.headerCellText
            stackView.addArrangedSubview(label2)

            headerView.addSubview(stackView)
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 2
        case 2: return 2
        case 3: return 1
        case 4: return 1
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?

        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderDeliverCell)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderLocationCell)
        case 2:
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderSummaryCell)
            } else {
                cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderSummaryDetailCell)
            }
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderSubtotalCell)
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: CellName.myOrderTotalCell)
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
