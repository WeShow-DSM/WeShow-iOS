import UIKit

extension CALayer {
    func makeShadow() {
        self.shadowColor = UIColor(asset: WeShowIOSAsset.Color.pointMinus2)?.cgColor
        self.shadowOpacity = 0.06
        self.shadowRadius = 30
        self.shadowOffset = .init(width: 0, height: 2)
    }
}
