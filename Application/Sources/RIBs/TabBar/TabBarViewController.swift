import RIBs
import RxSwift
import UIKit

protocol TabBarPresentableListener: AnyObject {
}

final class TabBarViewController: UITabBarController, TabBarPresentable, TabBarViewControllable {

    weak var listener: TabBarPresentableListener?

    func setupTabBar(viewControllers: [ViewControllable]) {
        viewControllers[0].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "home"),
            selectedImage: .init(named: "selectedHome")
        )
        viewControllers[1].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "category"),
            selectedImage: .init(named: "selectedCategory")
        )
        viewControllers[2].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "search"),
            selectedImage: .init(named: "selectedSearch")
        )
        viewControllers[3].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "myPage"),
            selectedImage: .init(named: "selectedMyPage"))

        self.viewControllers = [
            UINavigationController(rootViewController: viewControllers[0].uiviewController),
            UINavigationController(rootViewController: viewControllers[1].uiviewController),
            UINavigationController(rootViewController: viewControllers[2].uiviewController),
            UINavigationController(rootViewController: viewControllers[3].uiviewController)
        ]
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 30
    }

}
