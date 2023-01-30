import RIBs

protocol TabBarDependency: Dependency {
}

final class TabBarComponent: Component<TabBarDependency> {
}

// MARK: - Builder

protocol TabBarBuildable: Buildable {
    func build(withListener listener: TabBarListener) -> TabBarRouting
}

final class TabBarBuilder: Builder<TabBarDependency>, TabBarBuildable {

    override init(dependency: TabBarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TabBarListener) -> TabBarRouting {
        let component = TabBarComponent(dependency: dependency)
        let viewController = TabBarViewController()
        let interactor = TabBarInteractor(presenter: viewController)
        let homeBuilder = HomeBuilder(dependency: component)
        let categoryBuilder = CategoryBuilder(dependency: component)
        let searchBuilder = SearchBuilder(dependency: component)
        let myPageBuilder = MyPageBuilder(dependency: component)

        interactor.listener = listener

        return TabBarRouter(
            interactor: interactor,
            viewController: viewController,
            homeBuilder: homeBuilder,
            categoryBuilder: categoryBuilder,
            searchBuilder: searchBuilder,
            myPageBuilder: myPageBuilder
        )
    }
}
