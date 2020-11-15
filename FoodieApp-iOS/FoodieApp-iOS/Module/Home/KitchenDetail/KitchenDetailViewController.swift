//
//  KitchenDetailViewController.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 14/11/20.
//

import UIKit

class KitchenDetailViewController: UIViewController {

    @IBOutlet weak var headerBox: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var viewBasketBox: UIView!
    @IBOutlet weak var viewBasketTotal: UILabel!

    private let collectionViewCellSpacing: CGFloat = 28

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupCollectionView()
    }

    private func setupHeader() {
        headerBox.withShadow()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setupLayout(spacing: collectionViewCellSpacing)

        collectionView.register(
            UINib(nibName: CellName.kitchenDetailCell, bundle: nil),
            forCellWithReuseIdentifier: CellName.kitchenDetailCell
        )
    }

    private func showViewBasketBox() {
        viewBasketBox.withShadow(shadowUpSide: true)
        viewBasketBox.isHidden = false
        collectionViewBottomConstraint.constant = viewBasketBox.frame.height
    }

    @IBAction func btnViewBasketTapped(_ sender: Any) {
        print(viewBasketTotal?.text ?? "")
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        dismissDetail()
    }
}

extension KitchenDetailViewController: UICollectionViewDelegateFlowLayout,
    UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        collectionView.setupLayoutSize(spacing: collectionViewCellSpacing, additionalHeight: 50)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 9
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellName.kitchenDetailCell, for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item \(indexPath.row)")
        showViewBasketBox()
    }
}
