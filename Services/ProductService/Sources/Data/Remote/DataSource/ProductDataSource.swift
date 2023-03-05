import Foundation

import RxSwift
import WeShowService

protocol ProductRemoteDataSource: WeShowRemoteDataSource<ProductAPI> {
    func fetchProductList() -> Single<ProductListEntity>
    func fetchDetailProduct(productId: Int) -> Single<DetailProductEntity>
    func searchCategory(category: CategoryType) -> Single<[ProductEntity]>
    func searchTitle(title: String) -> Single<[ProductEntity]>
    func takeProductInBasket(productId: Int, count: Int) -> Completable
    func fetchBasket() -> Single<BasketEntity>
    func order(productIds: [Int]) -> Completable
}
