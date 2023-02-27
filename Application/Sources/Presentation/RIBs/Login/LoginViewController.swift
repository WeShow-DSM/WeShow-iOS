import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol LoginPresentableListener: AnyObject {
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {

    weak var listener: LoginPresentableListener?

    private var disposeBag = DisposeBag()

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.image = .init(asset: WeShowIOSAsset.Images.navigationBarLogo)
    }
    private let loginLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "Login"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let idTextField = UITextField().then {
        $0.addPaddingToLeft()
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 1
        $0.placeholder = "아이디"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let passwordTextField = UITextField().then {
        $0.addPaddingToLeft()
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray50)
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.layer.borderColor = UIColor(asset: WeShowIOSAsset.Color.gray200)?.cgColor
        $0.layer.borderWidth = 1
        $0.placeholder = "비밀번호"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let errorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.text = "아이디 또는 비밀번호가 일치하지 않습니다."
        $0.textColor = .init(asset: WeShowIOSAsset.Color.subMinus1)
    }
    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.pointMinus1)
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    private let youNotSignupLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "아직 회원이 아니신가요?"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray500)
    }
    private let signupButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.init(asset: WeShowIOSAsset.Color.gray500), for: .normal)
        $0.setUnderLine()
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.navigationController?.navigationBar.setBackButton()
    }

    // MARK: - Bind
    private func bind() {
        Observable.combineLatest(self.idTextField.rx.text.orEmpty, self.passwordTextField.rx.text.orEmpty)
            .map { !$0.0.isEmpty && !$0.1.isEmpty }
            .subscribe(onNext: { isEnable in
                self.loginButton.rx.alpha.onNext(isEnable ? 1 : 0.5)
                self.loginButton.rx.isEnabled.onNext(isEnable)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension LoginViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem().direction(.row).alignItems(.center).define { flex in
                flex.addItem(logoImageView).width(30).height(30)
                flex.addItem(loginLabel).marginLeft(5)
            }
            .marginTop(15)

            flex.addItem(idTextField).height(50).cornerRadius(10).marginTop(15)
            flex.addItem(passwordTextField).height(50).cornerRadius(10).marginTop(15)
            flex.addItem(errorLabel).marginTop(10).marginLeft(5)

            flex.addItem(loginButton).height(50).cornerRadius(10).marginTop(10)

            flex.addItem().direction(.row).alignItems(.center).define { flex in
                flex.addItem(youNotSignupLabel)
                flex.addItem(signupButton).marginLeft(2)
            }
            .justifyContent(.center)
            .marginTop(15)
        }
        .marginHorizontal(24)
    }
}
