import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol MyPagePresentableListener: AnyObject {
}

final class MyPageViewController: UIViewController, MyPagePresentable, MyPageViewControllable {

    weak var listener: MyPagePresentableListener?

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let backgroundView = UIView().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        $0.layer.makeShadow()
    }
    private let profileView = UIView().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
    }
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 2
    }
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let editProfileButton = UIButton(type: .system).then {
        $0.setImage(.init(systemName: "pencil"), for: .normal)
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray500)
    }
    private let payLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray500)
    }
    private let movePayScreenButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
        $0.imageEdgeInsets = .init(top: 18, left: 173, bottom: 18, right: 20)
        $0.setImage(.init(systemName: "arrow.right.circle"), for: .normal)
        $0.setTitle("위대한 Pay", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray500)
        $0.titleEdgeInsets = .init(top: 19, left: 25, bottom: 19, right: 173)
    }
    private let moveOrderListScreenButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
        $0.imageEdgeInsets = .init(top: 18, left: 192, bottom: 18, right: 20)
        $0.setImage(.init(systemName: "arrow.right.circle"), for: .normal)
        $0.setTitle("주문목록", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray500)
        $0.titleEdgeInsets = .init(top: 19, left: 25, bottom: 19, right: 192)
    }
    private let moveExchangeListScreenButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
        $0.imageEdgeInsets = .init(top: 18, left: 114, bottom: 18, right: 20)
        $0.setImage(.init(systemName: "arrow.right.circle"), for: .normal)
        $0.setTitle("취소-반품-교환목록", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray500)
        $0.titleEdgeInsets = .init(top: 19, left: 25, bottom: 19, right: 114)
    }
    private let moveEnvironmentSettingScreenButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.layer.makeShadow()
        $0.imageEdgeInsets = .init(top: 18, left: 192, bottom: 18, right: 20)
        $0.setImage(.init(systemName: "arrow.right.circle"), for: .normal)
        $0.setTitle("환경설정", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.tintColor = .init(asset: WeShowIOSAsset.Color.gray500)
        $0.titleEdgeInsets = .init(top: 19, left: 25, bottom: 19, right: 192)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setDemoData()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }

    private func setDemoData() {
        self.nameLabel.text = "김기영"
        self.payLabel.text = "위대한 Pay 잔액 : 1,000,000원"
    }
}

// MARK: - Layout
extension MyPageViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(backgroundView).cornerRadius(20).position(.absolute).top(66).horizontally(0).bottom(0)
            flex.addItem(profileView).direction(.row).alignItems(.center).define { flex in
                flex.addItem(profileImageView).width(60).height(60).cornerRadius(30).marginLeft(20)
                flex.addItem().justifyContent(.center).define { flex in
                    flex.addItem().direction(.row).alignItems(.center).define { flex in
                        flex.addItem(nameLabel)
                        flex.addItem(editProfileButton).width(12).height(12).marginLeft(5)
                    }
                    flex.addItem(payLabel).marginTop(5)
                }
                .marginLeft(15)
                .height(100)
            }
            .marginHorizontal(view.frame.width / 11)
            .marginTop(16).cornerRadius(15)

            flex.addItem(movePayScreenButton).height(60).cornerRadius(15).marginTop(15)
                .marginHorizontal(view.frame.width / 11)

            flex.addItem(moveOrderListScreenButton).height(60).cornerRadius(15).marginTop(15)
                .marginHorizontal(view.frame.width / 11)

            flex.addItem(moveExchangeListScreenButton).height(60).cornerRadius(15).marginTop(15)
                .marginHorizontal(view.frame.width / 11)

            flex.addItem(moveEnvironmentSettingScreenButton).height(60).cornerRadius(15).marginTop(15)
                .marginHorizontal(view.frame.width / 11)

        }
    }
}
