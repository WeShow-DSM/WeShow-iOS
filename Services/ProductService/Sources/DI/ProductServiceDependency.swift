import Foundation

import Swinject

public extension Container {

    func registerProductSereviceDependency() {
        registerProductRepository()
        registerProductUseCase()
    }

    private func registerProductRepository() {
        self.register(ProductRemoteDataSource.self) { _ in
            ProductRemoteDataSourceImpl()
        }
        self.register(ProductRepository.self) { resolver in
            ProductRepositoryImpl(remoteDataSource: resolver.resolve(ProductRemoteDataSource.self)!)
        }
    }
    private func registerProductUseCase() {
        self.register(FetchProductListUseCase.self) { resolver in
            FetchProductListUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(FetchDetailProductUseCase.self) { resolver in
            FetchDetailProductUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(SearchCategoryUseCase.self) { resolver in
            SearchCategoryUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(SearchTitleUseCase.self) { resolver in
            SearchTitleUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(TakeProductInBasketUseCase.self) { resolver in
            TakeProductInBasketUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(FetchBasketUseCase.self) { resolver in
            FetchBasketUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
        self.register(OrderUseCase.self) { resolver in
            OrderUseCase(repository: resolver.resolve(ProductRepository.self)!)
        }
    }

}
