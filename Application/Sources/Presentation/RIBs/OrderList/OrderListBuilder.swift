import RIBs

protocol OrderListDependency: Dependency {
}

final class OrderListComponent: Component<OrderListDependency> {
}

// MARK: - Builder
protocol OrderListBuildable: Buildable {
    func build(withListener listener: OrderListListener) -> OrderListRouting
}

final class OrderListBuilder: Builder<OrderListDependency>, OrderListBuildable {

    override init(dependency: OrderListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OrderListListener) -> OrderListRouting {
        _ = OrderListComponent(dependency: dependency)
        let viewController = OrderListViewController()
        let interactor = OrderListInteractor(presenter: viewController)
        interactor.listener = listener
        return OrderListRouter(interactor: interactor, viewController: viewController)
    }
}
