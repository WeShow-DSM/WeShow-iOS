import RxSwift
import UIKit
import Then

final class RecentSearchView: UIViewController {
    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let recentSearchLabel = UILabel().then {
        $0.text = "최근 검색어"
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray700)
    }
    private let tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(RecentSearchCell.self, forCellReuseIdentifier: "recentSearchCell")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }
}

// MARK: - TableView
extension RecentSearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return RecentSearchCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

// MARK: - Layout
extension RecentSearchView {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all()
        self.rootFlexContainer.flex.layout(mode: .adjustHeight)
    }

    private func setupLayoutWithFlex() {
        print(self.rootFlexContainer.frame)
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(recentSearchLabel).marginTop(16).marginLeft(28).height(24)
            flex.addItem(tableView)
                .top(10)
                .marginHorizontal(24)
                .height(self.view.frame.height - 53)
        }
    }
}
