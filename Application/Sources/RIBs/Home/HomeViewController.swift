import RIBs
import RxSwift
import UIKit
import FlexLayout
import PinLayout
import Then

protocol HomePresentableListener: AnyObject {
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?

    private let rootFlexContainer = UIView()

    private let searchTextField = UITextField().then {
        $0.placeholder = "상품을 검색해주세요..."
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.addImageToLeft(.init(systemName: "magnifyingglass") ?? UIImage())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
