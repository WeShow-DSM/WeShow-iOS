import RIBs

protocol CategoryDependency: Dependency {
}

final class CategoryComponent: Component<CategoryDependency>, DetailCategoryDependency {
}

// MARK: - Builder
protocol CategoryBuildable: Buildable {
    func build(withListener listener: CategoryListener) -> CategoryRouting
}

final class CategoryBuilder: Builder<CategoryDependency>, CategoryBuildable {

    var initialState = CategoryPresentableState()

    override init(dependency: CategoryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CategoryListener) -> CategoryRouting {
        let component = CategoryComponent(dependency: dependency)
        let viewController = CategoryViewController()
        let detailCategoryBuilder = DetailCategoryBuilder(dependency: component)
        let interactor = CategoryInteractor(
            presenter: viewController,
            initialState: initialState
        )
        interactor.listener = listener
        return CategoryRouter(
            detailCategoryBuilder: detailCategoryBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
