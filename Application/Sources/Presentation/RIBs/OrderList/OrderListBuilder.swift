import RIBs

protocol OrderListDependency: Dependency {
}

final class OrderListComponent: Component<OrderListDependency>, CheckDeliveryDependency {
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
        let component = OrderListComponent(dependency: dependency)
        let checkDeliveryBuilder = CheckDeliveryBuilder(dependency: component)
        let viewController = OrderListViewController()
        let interactor = OrderListInteractor(initialState: .init(), presenter: viewController)
        interactor.listener = listener
        return OrderListRouter(
            checkDeliveryBuilder: checkDeliveryBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
