import Foundation

import WeShowService
import RxSwift

class ProductRemoteDataSourceImpl: WeShowRemoteDataSource<ProductAPI>, ProductRemoteDataSource {

    func fetchProductList() -> Single<ProductListEntity> {
        return request(.fetchProductList)
            .map(ProductListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchDetailProduct(productId: Int) -> Single<DetailProductEntity> {
        return request(.fetchDetailProduct(id: productId))
            .map(DetailProductResponse.self)
            .map { $0.toDomain() }
    }

    func searchCategory(category: CategoryType) -> Single<[ProductEntity]> {
        return request(.searchCategory(category: category))
            .map(ProductsResponse.self)
            .map { $0.toDomain() }
    }

    func searchTitle(title: String) -> Single<[ProductEntity]> {
        return request(.searchTitle(title: title))
            .map(ProductsResponse.self)
            .map { $0.toDomain() }
    }

    func takeProductInBasket(productId: Int, count: Int) -> Completable {
        return request(.takeProductInBasket(productId: productId, count: count))
            .asCompletable()
    }

    func fetchBasket() -> Single<BasketEntity> {
        return request(.fetchBasket)
            .map(BasketResponse.self)
            .map { $0.toDomain() }
    }

    func order(productIds: [Int]) -> Completable {
        return request(.order(products: productIds))
            .asCompletable()
    }

}
