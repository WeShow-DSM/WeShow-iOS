import RIBs
import RxSwift
import UIKit
import Then

protocol SearchPresentableListener: AnyObject {
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {

    weak var listener: SearchPresentableListener?
    private let rootFlexContainer = UIView()

    // MARK: - SearchBar

    private let searchBackView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = WeShowIOSAsset.Color.gray200.color
    }

    private let searchTextField = UITextField().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray200)
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.layer.cornerRadius = 15
        $0.placeholder = "상품을 검색해주세요..."
    }

    private let searchButton = UIButton().then {
        $0.setImage(WeShowIOSAsset.Images.magnifyingglass.image, for: .normal)
    }

    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let searchContainerView = UIView()
    private let recentSearchView = RecentSearchView()
    private let searchResultView = SearchResultView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        searchContainerView.backgroundColor = .init(asset: WeShowIOSAsset.Color.point)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }
}

// MARK: - Layout
extension SearchViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout(mode: .adjustHeight)

        [searchResultView, recentSearchView].forEach {
            addChild($0)
        }

        recentSearchView.didMove(toParent: self)
    }

    private func setupLayoutWithFlex() {
        print(self.rootFlexContainer.frame)
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(searchBackView).marginTop(15).height(50).marginHorizontal(24).direction(.row).define { flex in
                flex.addItem(searchTextField).marginLeft(15).marginVertical(10).marginRight(10).grow(1)
                flex.addItem(searchButton).marginRight(10).marginVertical(10).height(30)
            }
            flex.addItem(searchContainerView)
                .marginHorizontal(0)
                .height(self.view.safeAreaLayoutGuide.layoutFrame.height - 65)
                .define { flex in
                    flex.addItem(searchResultView.view).position(.absolute).all(0)
                    flex.addItem(recentSearchView.view).position(.absolute).all(0)
                }
        }
    }
}
