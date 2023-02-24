import RIBs

protocol OrderListInteractable: Interactable, CheckDeliveryListener {
    var router: OrderListRouting? { get set }
    var listener: OrderListListener? { get set }
}

protocol OrderListViewControllable: ViewControllable {
}

final class OrderListRouter: ViewableRouter<OrderListInteractable, OrderListViewControllable>, OrderListRouting {

    private let checkDeliveryBuilder: CheckDeliveryBuildable
    private let checkDeliveryRouter: CheckDeliveryRouting
    private var currentRouter: Routing?

    init(
        checkDeliveryBuilder: CheckDeliveryBuildable,
        interactor: OrderListInteractable,
        viewController: OrderListViewControllable
    ) {
        self.checkDeliveryBuilder = checkDeliveryBuilder
        self.checkDeliveryRouter = checkDeliveryBuilder.build(withListener: interactor)
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachDelieveryCheckRIB() {
        guard currentRouter == nil else { return }
        let deliveryCheckViewController = checkDeliveryRouter.viewControllable
        self.viewController.pushViewController(viewController: deliveryCheckViewController)
        self.currentRouter = checkDeliveryRouter
    }
    func detachRIB() {
        guard let router = currentRouter else { return }
        self.currentRouter = nil
        self.detachChild(router)
    }
}
