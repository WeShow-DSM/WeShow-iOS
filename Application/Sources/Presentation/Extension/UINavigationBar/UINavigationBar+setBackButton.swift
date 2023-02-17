import UIKit

extension UINavigationBar {
    func setBackButton() {
        let XButton = UIImage(systemName: "arrow.backward")?
            .withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -20, bottom: 0, right: 0.0))
        self.backIndicatorImage = XButton
        self.backIndicatorTransitionMaskImage = XButton
        self.topItem?.title = ""
        self.tintColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
}
