import RIBs

import UIKit

extension ViewControllable {
    func pushViewController(viewController: ViewControllable) {
        self.uiviewController.navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
}
