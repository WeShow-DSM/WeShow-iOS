import UIKit

import Cosmos
import FlexLayout
import PinLayout
import Then

class ProductCollectionViewCell: UICollectionViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let productImageView = UIImageView().then {
        $0.backgroundColor = WeShowIOSAsset.Color.gray25.color
        $0.contentMode = .scaleAspectFit
    }
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 8, weight: .regular)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray600)
        $0.numberOfLines = 2
    }
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray900)
    }
    private let starView = CosmosView().then {
        $0.settings.emptyImage = .init(asset: WeShowIOSAsset.Images.star)
        $0.settings.filledImage = .init(asset: WeShowIOSAsset.Images.starFill)
        $0.settings.fillMode = .precise
        $0.settings.starMargin = 3
        $0.settings.starSize = 7
        $0.settings.textColor = .init(asset: WeShowIOSAsset.Color.gray500) ?? .clear
        $0.settings.textFont = .systemFont(ofSize: 6, weight: .medium)
        $0.settings.textMargin = 4.5
        $0.settings.updateOnTouch = false
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }

    func setDemoData() {
        productImageView.image = .init()
        productNameLabel.text = "이것은 저희 로고입니다."
        priceLabel.text = "10,000원"
        starView.rating = 4.5
        starView.text = "(1,239)"
    }
}

// MARK: - Layout
extension ProductCollectionViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.width(105).define { flex in
            flex.addItem(productImageView).top(0).height(100).horizontally(0).cornerRadius(15)
            flex.addItem(productNameLabel).marginTop(5).horizontally(0)
            flex.addItem(priceLabel).marginTop(3).left(0)
            flex.addItem(starView).marginTop(3).horizontally(0)
        }
    }
}
