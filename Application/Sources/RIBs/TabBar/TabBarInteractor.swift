import RIBs
import RxSwift

protocol TabBarRouting: ViewableRouting {
}

protocol TabBarPresentable: Presentable {
    var listener: TabBarPresentableListener? { get set }
}

protocol TabBarListener: AnyObject {
}

final class TabBarInteractor: PresentableInteractor<TabBarPresentable>, TabBarInteractable, TabBarPresentableListener {

    weak var router: TabBarRouting?
    weak var listener: TabBarListener?

    override init(presenter: TabBarPresentable) {
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
