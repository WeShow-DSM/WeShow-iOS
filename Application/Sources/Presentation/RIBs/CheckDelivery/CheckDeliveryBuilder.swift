import RIBs

protocol CheckDeliveryDependency: Dependency {
}

final class CheckDeliveryComponent: Component<CheckDeliveryDependency> {
}

// MARK: - Builder
protocol CheckDeliveryBuildable: Buildable {
    func build(withListener listener: CheckDeliveryListener) -> CheckDeliveryRouting
}

final class CheckDeliveryBuilder: Builder<CheckDeliveryDependency>, CheckDeliveryBuildable {

    override init(dependency: CheckDeliveryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CheckDeliveryListener) -> CheckDeliveryRouting {
        _ = CheckDeliveryComponent(dependency: dependency)
        let viewController = CheckDeliveryViewController()
        let interactor = CheckDeliveryInteractor(presenter: viewController)
        interactor.listener = listener
        return CheckDeliveryRouter(interactor: interactor, viewController: viewController)
    }
}
