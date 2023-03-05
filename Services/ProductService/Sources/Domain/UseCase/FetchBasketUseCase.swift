import Foundation

import RxSwift

public class FetchBasketUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<BasketEntity> {
        return repository.fetchBasket()
    
    }
}
