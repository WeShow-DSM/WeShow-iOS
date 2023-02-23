import Foundation
import UIKit
import Cosmos
import FlexLayout
import PinLayout
import Then

class RecentSearchCell: UITableViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let recentProductLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray600)
        $0.numberOfLines = 1
    }

    private let searchCancelButton = UIButton().then {
        $0.setImage(WeShowIOSAsset.Images.searchCancel.image, for: .normal)
    }

    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setDemoData()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    func setDemoData() {
        recentProductLabel.text = "최근에 검색한 내용 뭐시기"
    }
}

// MARK: - Layout
extension RecentSearchCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout(mode: .adjustWidth)
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex
            .direction(.row)
            .alignItems(.start)
            .height(30).width(contentView.frame.width)
            .define { flex in
                flex.addItem(recentProductLabel)
                    .left(4)
                    .marginVertical(3)
                    .height(24)
                    .width(contentView.frame.width - 20)

            flex.addItem(searchCancelButton).marginRight(4).width(16).height(16).marginVertical(7)
        }
    }
}
