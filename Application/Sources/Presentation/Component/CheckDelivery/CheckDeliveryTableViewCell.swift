import UIKit

import FlexLayout
import PinLayout
import Then

class CheckDeliveryTableViewCell: UITableViewCell {

    private let rootFlexContainer = UIView().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
    }

    // MARK: - UI
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray500)
    }
    private let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray400)
    }

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        self.contentView.pin.height(85)
        return self.contentView.frame.size
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    func setDemoData() {
        self.locationLabel.text = "아산 (A) | 간선하차"
        self.dateLabel.text = "2023-03-01 18:00"
    }
}

// MARK: - Layout
extension CheckDeliveryTableViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(locationLabel).position(.absolute).top(16).left(20)
            flex.addItem(dateLabel).position(.absolute).bottom(16).left(20)
        }
        .cornerRadius(15)
        .marginBottom(15)
    }
}
