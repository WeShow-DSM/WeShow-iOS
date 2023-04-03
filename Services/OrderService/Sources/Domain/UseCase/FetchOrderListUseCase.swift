import Foundation

import RxSwift

public class FetchOrderListUseCase {

    private let repository: OrderRepository

    init(repository: OrderRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[OrderEntity]> {
        return repository.fetchOrderList()
    }

}
