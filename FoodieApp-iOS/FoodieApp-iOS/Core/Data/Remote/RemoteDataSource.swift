//
//  RemoteDataSource.swift
//  FoodieApp-iOS
//
//  Created by omrobbie on 20/11/20.
//

import Alamofire
import RxSwift

protocol RemoteDataSource {
    func getKitchens() -> Observable<[KitchenResponse]>
}

class RemoteDataSourceImpl {
    static let shared = RemoteDataSourceImpl()
}

extension RemoteDataSourceImpl: RemoteDataSource {
    func getKitchens() -> Observable<[KitchenResponse]> {
        Observable<[KitchenResponse]>.create { observer in
            let urlString = Endpoints.Gets.kitchens.url
            if let url = URL(string: urlString) {
                AF.request(url).validate().responseDecodable(of: KitchensResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value.kitchens)
                        observer.onCompleted()
                    case .failure:
                        observer.onError(URLError.invalidResponse)
                    }
                }
            } else {
                observer.onError(URLError.unreachable(urlString))
            }

            return Disposables.create()
        }
    }
}
