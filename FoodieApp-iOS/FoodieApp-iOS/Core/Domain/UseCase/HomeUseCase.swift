//
//  HomeUseCase.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import RxSwift

protocol HomeUseCase {
    func getKitchens() -> Observable<[KitchenModel]>
}

class HomeUseCaseImpl: HomeUseCase {
    private let repository: KitchenRepository

    init(repository: KitchenRepository) {
        self.repository = repository
    }

    func getKitchens() -> Observable<[KitchenModel]> {
        repository.getKitchens()
    }
}
