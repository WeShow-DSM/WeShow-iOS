import RIBs

protocol RootDependency: Dependency {
    // created by this RIB.
}

final class RootComponent: Component<RootDependency> {
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let tabBarBuilder = TabBarBuilder(dependency: component)

        return RootRouter(
            interactor: interactor,
            viewController: viewController,
            tabBarBuilder: tabBarBuilder
        )
    }
}
