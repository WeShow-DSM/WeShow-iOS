import RIBs
import RxSwift

protocol OrderListRouting: ViewableRouting {
}

protocol OrderListPresentable: Presentable {
    var listener: OrderListPresentableListener? { get set }
}

protocol OrderListListener: AnyObject {
}

final class OrderListInteractor: PresentableInteractor<OrderListPresentable>, OrderListInteractable, OrderListPresentableListener {

    weak var router: OrderListRouting?
    weak var listener: OrderListListener?

    override init(presenter: OrderListPresentable) {
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
