import RIBs
import ReactorKit
import RxSwift

protocol AuthRouting: ViewableRouting {
    func attachLoginRIB()
    func detachRIB()
}

protocol AuthPresentable: Presentable {
    var listener: AuthPresentableListener? { get set }
}

protocol AuthListener: AnyObject {
}

final class AuthInteractor: PresentableInteractor<AuthPresentable>, AuthInteractable, AuthPresentableListener, Reactor {

    typealias Action = AuthPresentableAction
    typealias State = AuthPresentableState

    enum Mutation {
    }

    var initialState: State

    weak var router: AuthRouting?
    weak var listener: AuthListener?

    init(
        initalState: State,
        presenter: AuthPresentable
    ) {
        self.initialState = initalState
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
extension AuthInteractor {
    func mutate(action: AuthPresentableAction) -> Observable<Mutation> {
        switch action {
        case .viewWillAppeaer:
            return detachRIB()
        case .loginButtonDidTap:
            return attachLoginRIBMutation()
        }
    }
}

// MARK: - Mutation
extension AuthInteractor {
    private func attachLoginRIBMutation() -> Observable<Mutation> {
        self.router?.attachLoginRIB()
        return .empty()
    }
    private func detachRIB() -> Observable<Mutation> {
        self.router?.detachRIB()
        return .empty()
    }
}
