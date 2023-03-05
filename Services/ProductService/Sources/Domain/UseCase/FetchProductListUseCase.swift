import Foundation

import RxSwift

public class FetchProductListUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<ProductListEntity> {
        return repository.fetchProductList()
    }
}
