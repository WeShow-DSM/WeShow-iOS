import RIBs

protocol MyPageInteractable: Interactable, OrderListListener {
    var router: MyPageRouting? { get set }
    var listener: MyPageListener? { get set }
}

protocol MyPageViewControllable: ViewControllable {
    func pushViewController(viewController: ViewControllable)
}

final class MyPageRouter: ViewableRouter<MyPageInteractable, MyPageViewControllable>, MyPageRouting {

    private let orderListBuilder: OrderListBuildable
    private let orderListRouter: OrderListRouting
    private var currentRouting: Routing?

    init(
        orderListBuilder: OrderListBuildable,
        interactor: MyPageInteractable,
        viewController: MyPageViewControllable
    ) {
        self.orderListBuilder = orderListBuilder
        self.orderListRouter = orderListBuilder.build(
            withListener: interactor
        )
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachOrderListRIB() {
        guard currentRouting == nil else { return }
        let orderListViewController = orderListRouter.viewControllable
        viewController.pushViewController(viewController: orderListViewController)
        self.currentRouting = orderListRouter
        self.attachChild(orderListRouter)
    }
    func detachRIB() {
        guard let router = currentRouting else { return }
        self.currentRouting = nil
        self.detachChild(router)
    }
}
