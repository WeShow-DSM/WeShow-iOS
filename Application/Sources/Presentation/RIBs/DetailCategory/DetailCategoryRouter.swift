import RIBs

protocol DetailCategoryInteractable: Interactable {
    var router: DetailCategoryRouting? { get set }
    var listener: DetailCategoryListener? { get set }
}

protocol DetailCategoryViewControllable: ViewControllable {
}

// swiftlint:disable line_length
final class DetailCategoryRouter: ViewableRouter<DetailCategoryInteractable, DetailCategoryViewControllable>, DetailCategoryRouting {

    override init(interactor: DetailCategoryInteractable, viewController: DetailCategoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
