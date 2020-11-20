//
//  KItchenResponse.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

struct KitchenResponse: Decodable {
    let kitchenId: String?
    let name: String?
    let category: String?
    let rating: Double?
    let longitude: Double?
    let latitude: Double?
    let imageName: String?

    private enum CodingKeys: String, CodingKey {
        case kitchenId = "kitchen_id"
        case name = "name"
        case category = "category"
        case rating = "rating"
        case longitude = "longitude"
        case latitude = "latitude"
        case imageName = "image_name"
    }
}

struct KitchensResponse: Decodable {
    let kitchens: [KitchenResponse]
}
