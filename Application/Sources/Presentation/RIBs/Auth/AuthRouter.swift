import RIBs

protocol AuthInteractable: Interactable, LoginListener {
    var router: AuthRouting? { get set }
    var listener: AuthListener? { get set }
}

protocol AuthViewControllable: ViewControllable {
}

final class AuthRouter: ViewableRouter<AuthInteractable, AuthViewControllable>, AuthRouting {

    var loginBuilder: LoginBuildable
    var loginRouter: LoginRouting
    var currentRouting: Routing?

    init(
        loginBuilder: LoginBuildable,
        interactor: AuthInteractable,
        viewController: AuthViewControllable
    ) {
        self.loginBuilder = loginBuilder
        self.loginRouter = loginBuilder.build(withListener: interactor)
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachLoginRIB() {
        guard currentRouting == nil else { return }
        let loginViewController = loginRouter.viewControllable
        self.viewControllable.pushViewController(viewController: loginViewController)
        self.currentRouting = loginRouter
        self.attachChild(loginRouter)
    }
    func detachRIB() {
        guard let router = currentRouting else { return }
        self.currentRouting = nil
        self.detachChild(router)
    }
}
