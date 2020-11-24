//
//  KitchenRepository.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Foundation
import RxSwift

protocol KitchenRepository {
    func getKitchens() -> Observable<[KitchenModel]>
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
    func getKitchens() -> Observable<[KitchenModel]> {
        remote.getKitchens()
            .map { KitchenMapper.mapResponseToDomain(response: $0) }
    }
}
