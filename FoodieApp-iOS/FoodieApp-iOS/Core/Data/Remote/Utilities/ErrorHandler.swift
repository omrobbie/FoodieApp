//
//  ErrorHandler.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Foundation

enum URLError: LocalizedError {
    case unreachable(URL)
    case invalidResponse

    var errorDescription: String {
        switch self {
        case .unreachable(let url):
            return "\(url.absoluteString) is unreachable."
        case .invalidResponse:
            return "The server responded with invalid response."
        }
    }
}
