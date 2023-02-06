import RIBs

protocol CategoryInteractable: Interactable {
    var router: CategoryRouting? { get set }
    var listener: CategoryListener? { get set }
}

protocol CategoryViewControllable: ViewControllable {
}

final class CategoryRouter: ViewableRouter<CategoryInteractable, CategoryViewControllable>, CategoryRouting {

    override init(interactor: CategoryInteractable, viewController: CategoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
