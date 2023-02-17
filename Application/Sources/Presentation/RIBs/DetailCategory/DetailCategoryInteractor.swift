import RIBs
import RxSwift

protocol DetailCategoryRouting: ViewableRouting {
}

protocol DetailCategoryPresentable: Presentable {
    var listener: DetailCategoryPresentableListener? { get set }
}

protocol DetailCategoryListener: AnyObject {
}

// swiftlint:disable line_length
final class DetailCategoryInteractor: PresentableInteractor<DetailCategoryPresentable>, DetailCategoryInteractable, DetailCategoryPresentableListener {

    weak var router: DetailCategoryRouting?
    weak var listener: DetailCategoryListener?

    override init(presenter: DetailCategoryPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
