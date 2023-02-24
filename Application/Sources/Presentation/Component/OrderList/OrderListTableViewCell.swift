import UIKit

import FlexLayout
import PinLayout
import Then

class OrderListTableViewCell: UITableViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let productImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
        $0.layer.makeShadow()
    }
    private let shippingStatusLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = UIColor(asset: WeShowIOSAsset.Color.gray800)
    }
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(asset: WeShowIOSAsset.Color.gray600)
    }
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = UIColor(asset: WeShowIOSAsset.Color.gray700)
    }
    private let productCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 8, weight: .medium)
        $0.textColor = UIColor(asset: WeShowIOSAsset.Color.gray400)
    }
    let writeReviewButton =  UIButton(type: .system).then {
        $0.imageEdgeInsets = .init(top: 1, left: 2, bottom: 1, right: 0)
        $0.setTitle("후기 작성", for: .normal)
        $0.setTitleColor(UIColor(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 8), forImageIn: .normal)
        $0.tintColor = UIColor(asset: WeShowIOSAsset.Color.gray500)
        $0.titleLabel?.font = .systemFont(ofSize: 8, weight: .semibold)
        $0.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 2)
    }
    let checkDeliveryButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.makeShadow()
        $0.setTitle("배송 조회", for: .normal)
        $0.setTitleColor(UIColor(asset: WeShowIOSAsset.Color.gray700), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    let applicationForExchangeButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.makeShadow()
        $0.setTitle("교환 환불 신청", for: .normal)
        $0.setTitleColor(UIColor(asset: WeShowIOSAsset.Color.gray700), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
    }

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        contentView.frame.size.height = 120
        return contentView.frame.size
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    func setDemoData() {
        self.shippingStatusLabel.text = "배송중"
        self.titleLabel.text = "반갑습니다. 여러분들"
        self.priceLabel.text = "54,000원"
        self.productCountLabel.text = "1개"
    }
}

// MARK: - Layout
extension OrderListTableViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.direction(.row).define { flex in
            flex.addItem(productImageView).width(100).height(110).cornerRadius(15)
                .position(.absolute).vertically(0).left(0)

            flex.addItem().define { flex in
                flex.addItem(shippingStatusLabel).marginTop(5)
                flex.addItem(titleLabel).marginTop(3)

                flex.addItem().direction(.row).alignItems(.end).define { flex in
                    flex.addItem(priceLabel)
                    flex.addItem(productCountLabel).marginLeft(2)
                }
                .marginTop(3)

                flex.addItem(writeReviewButton).height(10).marginTop(3).width(45)

                flex.addItem().direction(.row).define { flex in
                    flex.addItem(checkDeliveryButton).width(110).height(31).cornerRadius(10)
                    flex.addItem(applicationForExchangeButton).width(110).height(31).cornerRadius(10)
                        .position(.absolute).right(0)
                }
                .marginTop(17)
            }
            .position(.absolute)
            .right(0)
            .left(110)
            .marginBottom(15)
        }
    }
}
