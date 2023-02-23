import RIBs
import ReactorKit
import RxSwift
import RxCocoa

protocol CategoryRouting: ViewableRouting {
    func attachToDetailCategoryRIB(categoryTitle: String)
    func detachToDetailCategoryRIB()
}

protocol CategoryPresentable: Presentable {
    var listener: CategoryPresentableListener? { get set }
}

protocol CategoryListener: AnyObject {
}

// swiftlint:disable line_length
final class CategoryInteractor: PresentableInteractor<CategoryPresentable>, CategoryInteractable, CategoryPresentableListener, Reactor {

    typealias Action = CategoryPresentableAction
    typealias State = CategoryPresentableState

    enum Mutation {
        case attachDetailCategoryRIB(String)
    }

    weak var router: CategoryRouting?
    weak var listener: CategoryListener?

    let initialState: CategoryPresentableState

    init(
        presenter: CategoryPresentable,
        initialState: CategoryPresentableState
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

// MARK: - muate
extension CategoryInteractor {
    func mutate(action: CategoryPresentableAction) -> Observable<Mutation> {
        switch action {
        case .loadDetail(let categoryTitle):
            return loadDetailMutation(categoryTitle: categoryTitle)
        default:
            self.router?.detachToDetailCategoryRIB()
            return .empty()
        }
    }
}

// MARK: Mutation
extension CategoryInteractor {
    private func loadDetailMutation(categoryTitle: String) -> Observable<Mutation> {
        self.router?.attachToDetailCategoryRIB(categoryTitle: categoryTitle)
        return .just(.attachDetailCategoryRIB(categoryTitle))
    }
}
