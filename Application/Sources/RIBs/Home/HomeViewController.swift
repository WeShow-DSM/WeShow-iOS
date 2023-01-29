import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
