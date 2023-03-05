import Foundation

import RxSwift
import WeShowService

protocol OrderRemoteDataSource: WeShowRemoteDataSource<OrderAPI> {
    func fetchOrderList() -> Single<[OrderEntity]>
}
