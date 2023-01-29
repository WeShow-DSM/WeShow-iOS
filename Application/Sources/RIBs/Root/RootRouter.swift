import RIBs

protocol RootInteractable: Interactable, TabBarListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let tabBarBuilder: TabBarBuildable

    private var tabBar: ViewableRouting?

    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        tabBarBuilder: TabBarBuildable
    ) {
        self.tabBarBuilder = tabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        attachTabBar()
    }

    private func attachTabBar() {
        let tabBar = tabBarBuilder.build(withListener: interactor)
        self.tabBar = tabBar
        attachChild(tabBar)
        viewController.present(viewController: tabBar.viewControllable)
    }

}
