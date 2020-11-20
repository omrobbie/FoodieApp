//
//  KitchenRepository.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Foundation

protocol KitchenRepository {
    func getKitchens(completion: @escaping (Result<[KitchenModel], URLError>) -> Void)
}

class KitchenRepositoryImpl {
    typealias Instance = (RemoteDataSource) -> KitchenRepositoryImpl

    private let remote: RemoteDataSource

    private init(remote: RemoteDataSource) {
        self.remote = remote
    }

    static let shared: Instance = { remoteRepo in
        KitchenRepositoryImpl(remote: remoteRepo)
    }
}

extension KitchenRepositoryImpl: KitchenRepository {
    func getKitchens(completion: @escaping (Result<[KitchenModel], URLError>) -> Void) {
        remote.getKitchens { response in
            switch response {
            case .success(let value):
                let mapper = KitchenMapper.mapResponseToDomain(response: value)
                completion(.success(mapper))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
