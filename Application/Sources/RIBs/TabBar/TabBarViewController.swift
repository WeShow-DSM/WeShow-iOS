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
            selectedImage: .init(named: "home")
        )
        viewControllers[1].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "category"),
            selectedImage: .init(named: "category")
        )
        viewControllers[2].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "search"),
            selectedImage: .init(named: "search")
        )
        viewControllers[3].uiviewController.tabBarItem = .init(
            title: "",
            image: .init(named: "myPage"),
            selectedImage: .init(named: "myPage"))

        self.viewControllers = [
            UINavigationController(rootViewController: viewControllers[0].uiviewController),
            UINavigationController(rootViewController: viewControllers[1].uiviewController),
            UINavigationController(rootViewController: viewControllers[2].uiviewController),
            UINavigationController(rootViewController: viewControllers[3].uiviewController)
        ]
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.cornerRadius = 30
    }

}
