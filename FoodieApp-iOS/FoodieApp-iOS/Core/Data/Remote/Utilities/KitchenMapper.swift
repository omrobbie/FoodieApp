//
//  KitchenMapper.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

struct KitchenMapper {
    static func mapResponseToDomain(response: [KitchenResponse]) -> [KitchenModel] {
        response.map { result in
            KitchenModel(
                kitchenId: result.kitchenId ?? "",
                name: result.name ?? "",
                category: result.category ?? "",
                rating: result.rating ?? 0,
                longitude: result.longitude ?? 0,
                latitude: result.latitude ?? 0,
                imageName: result.imageName ?? ""
            )
        }
    }
}
