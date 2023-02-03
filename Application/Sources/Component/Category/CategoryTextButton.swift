import UIKit

class CategoryTextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let attributedTextWhenNormal = NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold),
                NSAttributedString.Key.foregroundColor: UIColor(asset: WeShowIOSAsset.Color.gray800)!
            ]
        )
        let attributedTextWhenSelected = NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light),
                NSAttributedString.Key.foregroundColor: UIColor(asset: WeShowIOSAsset.Color.gray500)!
            ]
        )
        self.setAttributedTitle(attributedTextWhenNormal, for: .normal)
        self.setAttributedTitle(attributedTextWhenSelected, for: .selected)
    }
}
