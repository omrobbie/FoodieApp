//
//  RemoteDataSource.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Alamofire

protocol RemoteDataSource {
    func getKitchens(completion: @escaping (Result<[KitchenResponse], URLError>) -> Void)
}

class RemoteDataSourceImpl {
    static let shared = RemoteDataSourceImpl()
}

extension RemoteDataSourceImpl: RemoteDataSource {
    func getKitchens(completion: @escaping (Result<[KitchenResponse], URLError>) -> Void) {
        let urlString = Endpoints.Gets.kitchens.url
        guard let url = URL(string: urlString) else {return}

        AF.request(url).validate().responseDecodable(of: KitchensResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value.kitchens))
            case .failure:
                completion(.failure(.invalidResponse))
            }
        }
    }
}
