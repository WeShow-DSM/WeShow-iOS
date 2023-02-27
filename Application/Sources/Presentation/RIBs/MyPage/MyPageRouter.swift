import RIBs

protocol MyPageInteractable: Interactable, OrderListListener, AuthListener {
    var router: MyPageRouting? { get set }
    var listener: MyPageListener? { get set }
}

protocol MyPageViewControllable: ViewControllable {
}

final class MyPageRouter: ViewableRouter<MyPageInteractable, MyPageViewControllable>, MyPageRouting {

    private let orderListBuilder: OrderListBuildable
    private let orderListRouter: OrderListRouting
    private let authBuilder: AuthBuildable
    private let authRouter: AuthRouting
    private var currentRouting: Routing?

    init(
        orderListBuilder: OrderListBuildable,
        authBuilder: AuthBuildable,
        interactor: MyPageInteractable,
        viewController: MyPageViewControllable
    ) {
        self.orderListBuilder = orderListBuilder
        self.orderListRouter = orderListBuilder.build(
            withListener: interactor
        )
        self.authBuilder = authBuilder
        self.authRouter = authBuilder.build(
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
    func attachAuthRIB() {
        guard currentRouting == nil else { return }
        let authViewController = authRouter.viewControllable
        viewController.pushViewController(viewController: authViewController)
        self.currentRouting = authRouter
        self.attachChild(authRouter)
    }
    func detachRIB() {
        guard let router = currentRouting else { return }
        self.currentRouting = nil
        self.detachChild(router)
    }
}
