import RIBs

protocol CategoryDependency: Dependency {
}

final class CategoryComponent: Component<CategoryDependency> {
}

// MARK: - Builder

protocol CategoryBuildable: Buildable {
    func build(withListener listener: CategoryListener) -> CategoryRouting
}

final class CategoryBuilder: Builder<CategoryDependency>, CategoryBuildable {

    override init(dependency: CategoryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CategoryListener) -> CategoryRouting {
        _ = CategoryComponent(dependency: dependency)
        let viewController = CategoryViewController()
        let interactor = CategoryInteractor(presenter: viewController)
        interactor.listener = listener
        return CategoryRouter(interactor: interactor, viewController: viewController)
    }
}
