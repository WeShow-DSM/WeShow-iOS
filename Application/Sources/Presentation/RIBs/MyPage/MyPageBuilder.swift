import RIBs

protocol MyPageDependency: Dependency {
}

final class MyPageComponent: Component<MyPageDependency>, OrderListDependency {
}

// MARK: - Builder

protocol MyPageBuildable: Buildable {
    func build(withListener listener: MyPageListener) -> MyPageRouting
}

final class MyPageBuilder: Builder<MyPageDependency>, MyPageBuildable {

    override init(dependency: MyPageDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MyPageListener) -> MyPageRouting {
        let component = MyPageComponent(dependency: dependency)
        let viewController = MyPageViewController()
        let interactor = MyPageInteractor(
            presenter: viewController,
            initialState: MyPagePresentableState()
        )
        let orderListBuilder = OrderListBuilder(dependency: component)
        interactor.listener = listener
        return MyPageRouter(
            orderListBuilder: orderListBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
