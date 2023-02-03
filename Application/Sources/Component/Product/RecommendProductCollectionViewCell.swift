import UIKit

import Cosmos
import FlexLayout
import PinLayout
import Then

class RecommendProductCollectionViewCell: UICollectionViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let productImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
    }
    private let mostBougthProductLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 8, weight: .semibold)
        $0.text = "지금 가장 많이 사는 상품!"
        $0.textColor = .red
    }
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 8, weight: .regular)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray600)
        $0.numberOfLines = 2
    }
    private let discountPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray900)
    }
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 6, weight: .medium)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray400)
    }
    private let starView = CosmosView().then {
        $0.settings.emptyImage = .init(asset: WeShowIOSAsset.Images.star)
        $0.settings.filledImage = .init(asset: WeShowIOSAsset.Images.starFill)
        $0.settings.fillMode = .precise
        $0.settings.starMargin = 3
        $0.settings.starSize = 10
        $0.settings.textColor = .init(asset: WeShowIOSAsset.Color.gray500) ?? .clear
        $0.settings.textFont = .systemFont(ofSize: 6, weight: .medium)
        $0.settings.textMargin = 0
        $0.settings.updateOnTouch = false
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    func setDemoData() {
        productImageView.image = .init(asset: WeShowIOSAsset.Images.logo)
        productNameLabel.text = "저희 앱의 로고입니다."
        discountPriceLabel.text = "45,000원"
        priceLabel.attributedText = "50,000원".strikeLineToCenter()
        starView.rating = 4.5
        starView.text = "(1,999)"
    }
}

// MARK: - Layout
extension RecommendProductCollectionViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout(mode: .adjustWidth)
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.direction(.row).alignItems(.start).height(110).define { flex in
            flex.addItem(productImageView).vertically(0).left(0).width(100).height(110).cornerRadius(15)

            flex.addItem().marginLeft(10).define { flex in
                flex.addItem(mostBougthProductLabel).marginTop(5)
                flex.addItem(productNameLabel).paddingTop(3).width(100)

                flex.addItem().marginTop(3).direction(.row).define { flex in
                    flex.addItem(discountPriceLabel)
                    flex.addItem(priceLabel).marginLeft(2)
                }

                flex.addItem(starView).marginTop(3)
            }
        }
    }
}
