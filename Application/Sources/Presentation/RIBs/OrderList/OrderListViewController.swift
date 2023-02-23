import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol OrderListPresentableListener: AnyObject {
}

final class OrderListViewController: UIViewController, OrderListPresentable, OrderListViewControllable {

    weak var listener: OrderListPresentableListener?

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let orderListTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(OrderListTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = "주문목록"
        self.navigationController?.navigationBar.setBackButton()
    }
}

// MARK: - Layout
extension OrderListViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(orderListTableView).position(.absolute).all(0).horizontally(24)
        }
    }
}

// MARK: - TableView
extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {

    private func setTableView() {
        self.orderListTableView.delegate = self
        self.orderListTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? OrderListTableViewCell
        cell?.setDemoData()
        return cell ?? UITableViewCell()
    }
}
