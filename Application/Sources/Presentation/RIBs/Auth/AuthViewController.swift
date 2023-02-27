import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import ReactorKit
import RxCocoa
import Then

enum AuthPresentableAction {
    case loginButtonDidTap
    case viewWillAppeaer
}
struct AuthPresentableState {
}

protocol AuthPresentableListener: AnyObject {
    typealias Action = AuthPresentableAction
    typealias State = AuthPresentableState
    func sendAction(_ action: Action)
}

final class AuthViewController: UIViewController, AuthPresentable, AuthViewControllable {

    weak var listener: AuthPresentableListener?

    private var disposeBag = DisposeBag()
    private let viewWillAppear = PublishRelay<Void>()

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let logoImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
        $0.image = .init(asset: WeShowIOSAsset.Images.navigationBarLogo)
        $0.layer.makeShadow()
    }
    private let appNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "위대한 쇼핑"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let mentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.text = "페이지를 이용하기 위해 로그인이 필요합니다."
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray600)
    }
    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray25)
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.makeShadow()
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray900), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private let signupButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray25)
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.makeShadow()
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray900), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppear.accept(())
        self.setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.navigationItem.hidesBackButton = true
    }
    // MARK: - Bind
    private func bind() {
        self.loginButton.rx.tap.subscribe(onNext: {
            self.listener?.sendAction(.loginButtonDidTap)
        })
        .disposed(by: disposeBag)

        self.viewWillAppear.subscribe(onNext: {
            self.listener?.sendAction(.viewWillAppeaer)
        })
        .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension AuthViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.alignItems(.center).define { flex in
            flex.addItem(logoImageView).cornerRadius(20).marginTop(140).height(92).width(92)
            flex.addItem(appNameLabel).marginTop(10)
            flex.addItem(mentLabel).marginTop(5)

            flex.addItem().define { flex in
                flex.addItem(loginButton).cornerRadius(12).height(60).width(view.frame.width - 48)
                flex.addItem(signupButton).cornerRadius(12).marginTop(10).height(60).width(view.frame.width - 48)
            }
            .marginTop(22)
        }
    }
}
