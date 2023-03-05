import Foundation

import RxSwift

class ProductRepositoryImpl: ProductRepository {

    private let remoteDataSource: ProductRemoteDataSource

    init(remoteDataSource: ProductRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchProductList() -> Observable<ProductListEntity> {
        return remoteDataSource.fetchProductList()
            .asObservable()
    }

    func fetchDetailProduct(productId: Int) -> Single<DetailProductEntity> {
        return remoteDataSource.fetchDetailProduct(productId: productId)
    }

    func searchCategory(category: CategoryType) -> Observable<[ProductEntity]> {
        return remoteDataSource.searchCategory(category: category)
            .asObservable()
    }

    func searchTitle(title: String) -> Observable<[ProductEntity]> {
        return remoteDataSource.searchTitle(title: title)
            .asObservable()
    }

    func takeProductInBasket(productId: Int, count: Int) -> Completable {
        return remoteDataSource.takeProductInBasket(productId: productId, count: count)
    }

    func fetchBasket() -> Observable<BasketEntity> {
        return remoteDataSource.fetchBasket()
            .asObservable()
    }

    func order(products: [Int]) -> Completable {
        return remoteDataSource.order(productIds: products)
    }

}
