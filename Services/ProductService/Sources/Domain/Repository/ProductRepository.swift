import Foundation

import RxSwift

protocol ProductRepository {
    func fetchProductList() -> Observable<ProductListEntity>
    func fetchDetailProduct(productId: Int) -> Single<DetailProductEntity>
    func searchCategory(category: CategoryType) -> Observable<[ProductEntity]>
    func searchTitle(title: String) -> Observable<[ProductEntity]>
    func takeProductInBasket(productId: Int, count: Int) -> Completable
    func fetchBasket() -> Observable<BasketEntity>
    func order(products: [Int]) -> Completable
}
