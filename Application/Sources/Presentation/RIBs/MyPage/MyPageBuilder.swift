import RIBs

protocol MyPageDependency: Dependency {
}

final class MyPageComponent: Component<MyPageDependency>, OrderListDependency, AuthDependency {
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
        let authBuilder = AuthBuilder(dependency: component)
        interactor.listener = listener

        return MyPageRouter(
            orderListBuilder: orderListBuilder,
            authBuilder: authBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
