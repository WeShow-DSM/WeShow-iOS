import Foundation

import RxSwift

protocol OrderRepository {
    func fetchOrderList() -> Observable<[OrderEntity]>
}
