import Foundation

import RxSwift

public class FetchDetailProductUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute(productId: Int) -> Single<DetailProductEntity> {
        return repository.fetchDetailProduct(productId: productId)
    }

}
