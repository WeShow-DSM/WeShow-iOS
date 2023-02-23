import RIBs

protocol OrderListInteractable: Interactable {
    var router: OrderListRouting? { get set }
    var listener: OrderListListener? { get set }
}

protocol OrderListViewControllable: ViewControllable {
}

final class OrderListRouter: ViewableRouter<OrderListInteractable, OrderListViewControllable>, OrderListRouting {

    override init(interactor: OrderListInteractable, viewController: OrderListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
