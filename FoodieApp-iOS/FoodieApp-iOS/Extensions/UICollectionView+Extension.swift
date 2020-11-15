//
//  UICollectionView+Extension.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 15/11/20.
//

import UIKit

extension UICollectionView {
    /// Set this at viewDidLoad to handle balance sizing of CollectionView.
    /// - Parameter spacing: Space between items (default: 16)
    func setupLayout(spacing: CGFloat = 16) {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        collectionViewLayout = layout
    }

    /// For handle balance sizing of CollectionView sizeForItemAt protocol.
    /// - Parameter spacing: Space between items (default: 16)
    /// - Parameter additionalHeight: Give more height to avoid square
    /// - Returns: Return CGSize as needed
    func setupLayoutSize(spacing: CGFloat = 16, additionalHeight: CGFloat = 0) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = spacing

        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (self.bounds.width - totalSpacing) / numberOfItemsPerRow

        return CGSize(width: width, height: width + additionalHeight)
    }
}
