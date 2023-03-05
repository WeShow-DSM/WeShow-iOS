import Foundation

import RxSwift

public class TakeProductInBasketUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute(productId: Int, count: Int) -> Completable {
        return repository.takeProductInBasket(productId: productId, count: count)
    }

}
