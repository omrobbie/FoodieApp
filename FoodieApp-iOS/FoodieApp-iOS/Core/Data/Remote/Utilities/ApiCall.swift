//
//  ApiCall.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

struct Api {
    static let baseUrl = "https://omrobbie.com/cleq/"
}

protocol EndPoint {
    var url: String {get}
}

enum Endpoints {
    enum Gets: EndPoint {
        case kitchens

        var url: String {
            switch self {
            case .kitchens: return "\(Api.baseUrl)kitchens"
            }
        }
    }
}
