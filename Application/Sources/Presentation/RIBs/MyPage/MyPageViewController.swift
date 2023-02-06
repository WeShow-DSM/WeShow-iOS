import RIBs
import RxSwift
import UIKit

protocol MyPagePresentableListener: AnyObject {
}

final class MyPageViewController: UIViewController, MyPagePresentable, MyPageViewControllable {

    weak var listener: MyPagePresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
