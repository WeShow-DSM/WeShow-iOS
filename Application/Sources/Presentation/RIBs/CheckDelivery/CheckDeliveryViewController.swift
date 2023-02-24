import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol CheckDeliveryPresentableListener: AnyObject {
}

final class CheckDeliveryViewController: UIViewController, CheckDeliveryPresentable, CheckDeliveryViewControllable {

    weak var listener: CheckDeliveryPresentableListener?

    private let rootFlexContaner = UIView()

    // MARK: - UI
    private let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let productImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.layer.makeShadow()
    }
    private let shippingStatusLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray800)
    }
    private let productTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray600)
    }
    private let deliveryStatusLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.text = "배송 현황"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let checkDeliveryTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(CheckDeliveryTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setDemoData()
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

    // MARK: - Navivgation
    private func setNavigation() {
        self.title = "배송 현황"
        self.navigationController?.navigationBar.setBackButton()
    }

    private func setDemoData() {
        self.dateLabel.text = "2023-02-28 주문"
        self.shippingStatusLabel.text = "배송중"
        self.productTitleLabel.text = "반가워요"
    }

}

// MARK: - Layout
extension CheckDeliveryViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContaner)
        self.rootFlexContaner.pin.all(view.pin.safeArea)
        self.rootFlexContaner.flex.layout()
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContaner.flex.define { flex in
            flex.addItem(dateLabel).marginTop(13)

            flex.addItem().direction(.row).define { flex in
                flex.addItem(productImageView).width(60).height(65).cornerRadius(8)

                flex.addItem().define { flex in
                    flex.addItem(shippingStatusLabel).marginTop(5)
                    flex.addItem(productTitleLabel).marginTop(3)
                }
                .marginLeft(10)
            }
            .marginTop(10)

            flex.addItem(deliveryStatusLabel).marginTop(25)

            flex.addItem(checkDeliveryTableView).position(.absolute).top(160).bottom(0).horizontally(0)
        }
        .marginHorizontal(24)
    }
}

// MARK: - TableView
extension CheckDeliveryViewController: UITableViewDelegate, UITableViewDataSource {
    private func setTableView() {
        self.checkDeliveryTableView.delegate = self
        self.checkDeliveryTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CheckDeliveryTableViewCell
        cell?.setDemoData()
        return cell ?? UITableViewCell()
    }
}
