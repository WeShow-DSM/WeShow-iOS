import RIBs
import ReactorKit
import RxSwift

protocol MyPageRouting: ViewableRouting {
    func attachOrderListRIB()
    func attachAuthRIB()
    func detachRIB()
}

protocol MyPagePresentable: Presentable {
    var listener: MyPagePresentableListener? { get set }
}

protocol MyPageListener: AnyObject {
}

// swiftlint:disable line_length
final class MyPageInteractor: PresentableInteractor<MyPagePresentable>, MyPageInteractable, MyPagePresentableListener, Reactor {

    typealias Action = MyPagePresentableAction
    typealias State = MyPagePresentableState

    enum Mutation {
    }

    weak var router: MyPageRouting?
    weak var listener: MyPageListener?

    let initialState: MyPagePresentableState

    init(
        presenter: MyPagePresentable,
        initialState: MyPagePresentableState
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
extension MyPageInteractor {
    func mutate(action: MyPagePresentableAction) -> Observable<Mutation> {
        switch action {
        case .orderListButtonDidTap:
            return attachOrderListMutation()
        default:
            return attachAuthMutation()
        }
    }
}

// MARK: - Mutation
extension MyPageInteractor {
    private func attachOrderListMutation() -> Observable<Mutation> {
        self.router?.attachOrderListRIB()
        return .empty()
    }
    private func attachAuthMutation() -> Observable<Mutation> {
        self.router?.attachAuthRIB()
        return .empty()
    }
}
