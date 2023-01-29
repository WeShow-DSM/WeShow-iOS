import RIBs

protocol MyPageDependency: Dependency {
}

final class MyPageComponent: Component<MyPageDependency> {
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
        _ = MyPageComponent(dependency: dependency)
        let viewController = MyPageViewController()
        let interactor = MyPageInteractor(presenter: viewController)
        interactor.listener = listener
        return MyPageRouter(interactor: interactor, viewController: viewController)
    }
}
