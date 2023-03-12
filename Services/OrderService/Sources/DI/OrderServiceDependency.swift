import Foundation

import Swinject

public extension Container {

    func registerOrderSereviceDependency() {
        registerOrderRepository()
        registerOrderUseCase()
    }

    private func registerOrderRepository() {
        self.register(OrderRemoteDataSource.self) { _ in
            OrderRemoteDataSourceImpl()
        }
        self.register(OrderRepository.self) { resolver in
            OrderRepositoryImpl(remoteDataSource: resolver.resolve(OrderRemoteDataSource.self)!)
        }
    }
    private func registerOrderUseCase() {
        self.register(FetchOrderListUseCase.self) { resolver in
            FetchOrderListUseCase(repository: resolver.resolve(OrderRepository.self)!)
        }
    }

}
