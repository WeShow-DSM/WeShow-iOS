import UIKit

import FlexLayout
import PinLayout
import Then

class CategoryTableViewCell: UITableViewCell {

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let categoryImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 1
    }
    private let categoryTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray500)
    }
    private let underLineView = UIView().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray200)
    }
    private let arrowImageview = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.image = .init(systemName: "chevron.right")
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray300)
    }

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.height(60)

        return contentView.frame.size
    }

    func setData(categoryImageString: String, categoryTitle: String) {
        self.categoryImageView.image = .init(named: categoryImageString)
        self.categoryTitleLabel.text = categoryTitle
    }
}

// MARK: - Layout
extension CategoryTableViewCell {
    private func setupRootFlexContainer() {
        self.contentView.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.direction(.row).alignItems(.center).height(60).define { flex in
            flex.addItem(categoryImageView).position(.absolute).left(5).marginVertical(5)
                .width(50).height(50).cornerRadius(10)

            flex.addItem().define { flex in
                flex.addItem(categoryTitleLabel).height(50)
                flex.addItem(underLineView).height(1).marginTop(4)
            }
            .position(.absolute).left(70).right(20).top(5)

            flex.addItem(arrowImageview).width(5).height(16).vertically(22).position(.absolute).right(5)
        }
    }
}
