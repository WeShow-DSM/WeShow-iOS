import RIBs

protocol DetailCategoryDependency: Dependency {
}

final class DetailCategoryComponent: Component<DetailCategoryDependency> {
}

// MARK: - Builder
protocol DetailCategoryBuildable: Buildable {
    func build(withListener listener: DetailCategoryListener) -> DetailCategoryRouting
}

final class DetailCategoryBuilder: Builder<DetailCategoryDependency>, DetailCategoryBuildable {

    override init(dependency: DetailCategoryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DetailCategoryListener) -> DetailCategoryRouting {
        _ = DetailCategoryComponent(dependency: dependency)
        let viewController = DetailCategoryViewController()
        let interactor = DetailCategoryInteractor(presenter: viewController)
        interactor.listener = listener
        return DetailCategoryRouter(interactor: interactor, viewController: viewController)
    }
}
