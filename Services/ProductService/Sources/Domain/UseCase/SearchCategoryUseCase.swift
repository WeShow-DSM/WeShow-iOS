import Foundation

import RxSwift

public class SearchCategoryUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute(category: CategoryType) -> Observable<[ProductEntity]> {
        return repository.searchCategory(category: category)
    }
}
