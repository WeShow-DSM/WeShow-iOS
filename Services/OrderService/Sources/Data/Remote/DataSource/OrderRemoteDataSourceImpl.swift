import Foundation

import RxSwift
import WeShowService

class OrderRemoteDataSourceImpl: WeShowRemoteDataSource<OrderAPI>, OrderRemoteDataSource {

    func fetchOrderList() -> Single<[OrderEntity]> {
        return request(.fetchOrderList)
            .map(OrderListResponse.self)
            .map { $0.toDomain() }
    }

}
