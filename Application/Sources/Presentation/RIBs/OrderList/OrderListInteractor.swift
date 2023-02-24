import RIBs
import ReactorKit
import RxSwift

protocol OrderListRouting: ViewableRouting {
    func attachDelieveryCheckRIB()
    func detachRIB()
}

protocol OrderListPresentable: Presentable {
    var listener: OrderListPresentableListener? { get set }
}

protocol OrderListListener: AnyObject {
}

// swiftlint:disable line_length
final class OrderListInteractor: PresentableInteractor<OrderListPresentable>, OrderListInteractable, OrderListPresentableListener, Reactor {

    typealias Action = OrderListPresentableAction
    typealias State = OrderListPresentableState

    enum Mutation {
        case attachDeliveryCheckRIB
    }

    weak var router: OrderListRouting?
    weak var listener: OrderListListener?

    let initialState: OrderListPresentableState

    init(
        initialState: OrderListPresentableState,
        presenter: OrderListPresentable
    ) {
        self.initialState = initialState
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }

    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate
extension OrderListInteractor {
    func mutate(action: OrderListPresentableAction) -> Observable<Mutation> {
        switch action {
        case .deliveryCheckButtonDidTap:
            return attachCheckDeliveryRIBMutation()
        default:
            return detachRIBMutation()
        }
    }
}

// MARK: - Mutate
extension OrderListInteractor {
    private func attachCheckDeliveryRIBMutation() -> Observable<Mutation> {
        self.router?.attachDelieveryCheckRIB()
        return .just(.attachDeliveryCheckRIB)
    }
    private func detachRIBMutation() -> Observable<Mutation> {
        self.router?.detachRIB()
        return .empty()
    }
}
