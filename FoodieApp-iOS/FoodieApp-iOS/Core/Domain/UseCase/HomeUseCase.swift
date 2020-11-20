//
//  HomeUseCase.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

protocol HomeUseCase {
    func getKitchens(completion: @escaping (Result<[KitchenModel], URLError>) -> Void)
}

class HomeUseCaseImpl: HomeUseCase {
    private let repository: KitchenRepository

    init(repository: KitchenRepository) {
        self.repository = repository
    }

    func getKitchens(completion: @escaping (Result<[KitchenModel], URLError>) -> Void) {
        repository.getKitchens { result in
            completion(result)
        }
    }
}
