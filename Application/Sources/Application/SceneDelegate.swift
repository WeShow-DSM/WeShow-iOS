import UIKit
import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var launchRouter: LaunchRouting?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let launchRouter = RootBuilder(dependency: AppComponent()).build()
            self.launchRouter = launchRouter
            launchRouter.launch(from: window)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}
