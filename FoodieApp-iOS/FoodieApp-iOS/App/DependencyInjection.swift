//
//  DependencyInjection.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

struct DependencyInjection {
    static private func provideRepository() -> KitchenRepository {
        let remote = RemoteDataSourceImpl.shared
        return KitchenRepositoryImpl.shared(remote)
    }

    static func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeUseCaseImpl(repository: repository)
    }
}
