import UIKit

import FlexLayout
import PinLayout
import Then

class InformationCollectionViewCell: UICollectionViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let informationImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = WeShowIOSAsset.Color.gray25.color
        $0.layer.shadowColor = UIColor(asset: WeShowIOSAsset.Color.pointMinus2)!.cgColor
        $0.layer.shadowRadius = 3
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 0.1
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }

    func setDemoData() {
        informationImageView.image = .init()
    }
}

extension InformationCollectionViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(informationImageView).margin(1).width(345).height(130).cornerRadius(20)
        }
    }
}
