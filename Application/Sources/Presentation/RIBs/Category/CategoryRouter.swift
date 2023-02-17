import RIBs

protocol CategoryInteractable: Interactable, DetailCategoryListener {
    var router: CategoryRouting? { get set }
    var listener: CategoryListener? { get set }
}

protocol CategoryViewControllable: ViewControllable {
    func pushViewController(viewController: ViewControllable)
}

// swiftlint:disable line_length
final class CategoryRouter: ViewableRouter<CategoryInteractable, CategoryViewControllable>, CategoryRouting {

    private let detailCategoryBuilder: DetailCategoryBuildable
    private let detailCategoryRouter: DetailCategoryRouting
    private var currentRouter: Routing?

    init(
        detailCategoryBuilder: DetailCategoryBuildable,
        interactor: CategoryInteractor,
        viewController: CategoryViewControllable
    ) {
        self.detailCategoryBuilder = detailCategoryBuilder
        self.detailCategoryRouter = detailCategoryBuilder.build(
            withListener: interactor
        )
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachToDetailCategoryRIB(categoryTitle: String) {
        guard currentRouter == nil else { return }
        let detailViewController = detailCategoryRouter.viewControllable.uiviewController as? DetailCategoryViewController
        detailViewController?.categoryTitle = categoryTitle
        viewController.pushViewController(viewController: detailViewController!)
        self.currentRouter = detailCategoryRouter
        self.attachChild(detailCategoryRouter)
    }
    func detachToDetailCategoryRIB() {
        guard let router = currentRouter else { return }
        self.currentRouter = nil
        self.detachChild(router)
    }
}
