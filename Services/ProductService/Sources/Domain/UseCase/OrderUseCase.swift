import Foundation

import RxSwift

public class OrderUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute(products: [Int]) -> Completable {
        return repository.order(products: products)
    }

}
