import RIBs
import RxSwift
import UIKit

protocol CategoryPresentableListener: AnyObject {
}

final class CategoryViewController: UIViewController, CategoryPresentable, CategoryViewControllable {

    weak var listener: CategoryPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
