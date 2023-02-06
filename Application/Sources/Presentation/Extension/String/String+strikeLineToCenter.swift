import Foundation
import UIKit

extension String {
    func strikeLineToCenter() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttributes(
            [
                NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                NSAttributedString.Key.strikethroughColor: UIColor(asset: WeShowIOSAsset.Color.gray400)!
            ],
            range: NSString(string: self).range(of: self)
        )
        return attributeString
    }
}
