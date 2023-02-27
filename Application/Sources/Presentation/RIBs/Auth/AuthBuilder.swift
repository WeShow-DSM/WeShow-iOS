import RIBs

protocol AuthDependency: Dependency {
}

final class AuthComponent: Component<AuthDependency>, LoginDependency {
}

// MARK: - Builder
protocol AuthBuildable: Buildable {
    func build(withListener listener: AuthListener) -> AuthRouting
}

final class AuthBuilder: Builder<AuthDependency>, AuthBuildable {

    override init(dependency: AuthDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AuthListener) -> AuthRouting {
        let component = AuthComponent(dependency: dependency)
        let viewController = AuthViewController()
        let loginBuilder = LoginBuilder(dependency: component)
        let interactor = AuthInteractor(initalState: .init(), presenter: viewController)
        interactor.listener = listener
        return AuthRouter(
            loginBuilder: loginBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }

}
