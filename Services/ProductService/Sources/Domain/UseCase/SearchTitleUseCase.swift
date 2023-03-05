import Foundation

import RxSwift

public class SearchTitleUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    public func excute(title: String) -> Observable<[ProductEntity]> {
        return repository.searchTitle(title: title)
    }

}
