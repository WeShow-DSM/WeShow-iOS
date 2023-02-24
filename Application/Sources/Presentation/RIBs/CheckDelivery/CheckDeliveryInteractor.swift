import RIBs
import RxSwift

protocol CheckDeliveryRouting: ViewableRouting {
}

protocol CheckDeliveryPresentable: Presentable {
    var listener: CheckDeliveryPresentableListener? { get set }
}

protocol CheckDeliveryListener: AnyObject {
}

// swiftlint:disable line_length
final class CheckDeliveryInteractor: PresentableInteractor<CheckDeliveryPresentable>, CheckDeliveryInteractable, CheckDeliveryPresentableListener {

    weak var router: CheckDeliveryRouting?
    weak var listener: CheckDeliveryListener?

    override init(presenter: CheckDeliveryPresentable) {
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
