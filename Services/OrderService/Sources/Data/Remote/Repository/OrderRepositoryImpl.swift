import Foundation

import RxSwift

class OrderRepositoryImpl: OrderRepository {

    let remoteDataSource: OrderRemoteDataSource

    init(remoteDataSource: OrderRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchOrderList() -> Observable<[OrderEntity]> {
        return remoteDataSource.fetchOrderList()
            .asObservable()
    }

}
