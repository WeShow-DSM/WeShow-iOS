import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import ReactorKit
import RxCocoa
import Then

enum CategoryPresentableAction {
    case loadDetail(String)
    case viewWillAppear
}
struct CategoryPresentableState {
}

protocol CategoryPresentableListener: AnyObject {
    typealias Action = CategoryPresentableAction
    typealias State = CategoryPresentableState

    func sendAction(_ action: Action)
}

final class CategoryViewController: UIViewController, CategoryPresentable, CategoryViewControllable {

    weak var listener: CategoryPresentableListener?

    private var disposeBag = DisposeBag()
    private let viewWillAppear = PublishRelay<Void>()
    private let categoryImageStringList = ["feed", "toy", "walkingProduct",
                                           "sanitaryProduct", "electronicDevices", "beauty",
                                           "clothing", "interior", "toiletProduct", ""]
    private let categoryTitleList = ["사료, 간식", "장난감", "산책용품", "위생용품", "전자기기",
                                     "미용 & 청결", "의류", "홈인테리어", "배변용품", "기타"]

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let categoryTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.register(CategoryTableViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setTableView()
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppear.accept(())
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }

    // MARK: - Bind
    private func bind() {
        self.categoryTableView.rx.itemSelected.subscribe(onNext: {
            self.listener?.sendAction(.loadDetail(self.categoryTitleList[$0.row]))
        })
        .disposed(by: disposeBag)
        self.viewWillAppear.subscribe(onNext: {
            self.listener?.sendAction(.viewWillAppear)
        })
        .disposed(by: disposeBag)
    }

    // MARK: - Router
    func pushViewController(viewController: ViewControllable) {
        self.navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
}

// MARK: - Layout
extension CategoryViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(categoryTableView).position(.absolute).all(0).marginHorizontal(24)
        }
    }
}

// MARK: - TableView
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    private func setTableView() {
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CategoryTableViewCell
        cell?.setData(
            categoryImageString: categoryImageStringList[indexPath.row],
            categoryTitle: categoryTitleList[indexPath.row]
        )

        return cell ?? UITableViewCell()
    }
}
