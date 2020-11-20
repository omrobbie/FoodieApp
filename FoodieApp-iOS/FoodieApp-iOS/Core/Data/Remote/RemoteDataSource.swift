//
//  RemoteDataSource.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Foundation

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

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.unreachable(url)))
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(KitchensResponse.self, from: data)
                    print(decodeData.kitchens)
                    completion(.success(decodeData.kitchens))
                } catch {
                    completion(.failure(.invalidResponse))
                }
            }
        }.resume()
    }
}
