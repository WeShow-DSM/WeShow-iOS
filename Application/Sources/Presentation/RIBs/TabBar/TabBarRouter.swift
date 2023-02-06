import RIBs

protocol TabBarInteractable: Interactable, HomeListener, CategoryListener, SearchListener, MyPageListener {
    var router: TabBarRouting? { get set }
    var listener: TabBarListener? { get set }
}

protocol TabBarViewControllable: ViewControllable {
    func setupTabBar(viewControllers: [ViewControllable])
}

final class TabBarRouter: ViewableRouter<TabBarInteractable, TabBarViewControllable>, TabBarRouting {

    private let homeBuilder: HomeBuildable
    private let categoryBuilder: CategoryBuildable
    private let searchBuilder: SearchBuildable
    private let myPageBuilder: MyPageBuildable

    private var child: Routing?
    private var home: ViewableRouting
    private var category: ViewableRouting
    private var search: ViewableRouting
    private var myPage: ViewableRouting

    init(
        interactor: TabBarInteractable,
        viewController: TabBarViewControllable,
        homeBuilder: HomeBuildable,
        categoryBuilder: CategoryBuildable,
        searchBuilder: SearchBuildable,
        myPageBuilder: MyPageBuildable
    ) {
        self.homeBuilder = homeBuilder
        self.categoryBuilder = categoryBuilder
        self.searchBuilder = searchBuilder
        self.myPageBuilder = myPageBuilder

        self.home = homeBuilder.build(withListener: interactor)
        self.category = categoryBuilder.build(withListener: interactor)
        self.search = searchBuilder.build(withListener: interactor)
        self.myPage = myPageBuilder.build(withListener: interactor)

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self

        viewController.setupTabBar(viewControllers: [
            home.viewControllable,
            category.viewControllable,
            search.viewControllable,
            myPage.viewControllable
        ])
    }

    override func didLoad() {
        super.didLoad()
        attachHomeRIB()
        attachCategoryRIB()
        attachSearchRIB()
        attachMyPageRIB()
    }

    private func attachHomeRIB() {
        self.attachChild(home)
    }
    private func attachCategoryRIB() {
        self.attachChild(category)
    }
    private func attachSearchRIB() {
        self.attachChild(search)
    }
    private func attachMyPageRIB() {
        self.attachChild(myPage)
    }
}
