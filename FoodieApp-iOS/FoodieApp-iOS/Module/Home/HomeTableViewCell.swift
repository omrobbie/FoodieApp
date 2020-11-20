//
//  HomeTableViewCell.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 13/11/20.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblRatingAndDistance: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!

    func parse(_ item: KitchenModel) {
        lblName.text = item.name
        lblCategory.text = item.category
        lblRatingAndDistance.text = "\(item.rating)"
        imgThumbnail.kf.indicatorType = .activity
        imgThumbnail.kf.setImage(
            with: URL(string: "\(Api.imagePath)\(item.imageName)"),
            placeholder: UIImage(named: "image-placeholder")
        )
    }
}
