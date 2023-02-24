import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol HomePresentableListener: AnyObject {
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?

    private let rootFlexContainer = UIView()

    // MARK: - NavigationBarItem
    private let logoButton = UIButton().then {
        $0.setImage(.init(asset: WeShowIOSAsset.Images.navigationBarLogo), for: .normal)
        $0.imageEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
    }
    private let walletButton = UIButton(type: .system).then {
        $0.setImage(.init(asset: WeShowIOSAsset.Images.wallet), for: .normal)
    }
    private let shoppingButton = UIButton(type: .system).then {
        $0.contentVerticalAlignment = .top
        $0.semanticContentAttribute = .forceLeftToRight
        $0.setImage(.init(asset: WeShowIOSAsset.Images.shoppingBasket), for: .normal)
    }
    private let countLabel = UILabel().then {
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.point)
        $0.font = .systemFont(ofSize: 6, weight: .semibold)
        $0.layer.cornerRadius = 5.5
        $0.layer.masksToBounds = true
        $0.textColor = .white
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - UI
    private let searchTextField = UITextField().then {
        $0.addImageToLeft(.init(systemName: "magnifyingglass") ?? UIImage())
        $0.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray200)
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.layer.cornerRadius = 15
        $0.placeholder = "상품을 검색해주세요..."
    }
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let todaysInfoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "오늘의 신제품 & 할인 정보"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.pointMinus2)
    }
    private let todaysInfoCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
    ).then {
        $0.backgroundColor = .clear
        $0.register(InformationCollectionViewCell.self, forCellWithReuseIdentifier: "informationCell")
        $0.showsHorizontalScrollIndicator = false
        $0.tag = 1
    }

    private let popularProductLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "인기 상품"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.gray800)
    }
    private let allCategoryButton = CategoryTextButton(title: "전체")

    private let dogCategoryButton = CategoryTextButton(title: "강아지")

    private let catCategoryButton = CategoryTextButton(title: "고양이")

    private let popularProductCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 15
        }
    ).then {
        $0.backgroundColor = .clear
        $0.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "productCell")
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        $0.tag = 2
    }

    private let recommendLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "이런 제품도 있어요!"
        $0.textColor = .init(asset: WeShowIOSAsset.Color.pointMinus2)
    }
    private let recommendCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 15
            $0.scrollDirection = .horizontal
        }
    ).then {
        $0.backgroundColor = .clear
        $0.register(RecommendProductCollectionViewCell.self, forCellWithReuseIdentifier: "recommendProductCell")
        $0.showsHorizontalScrollIndicator = false
        $0.tag = 3
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setNavigation()
        view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayoutWithFlex()
        setupRootFlexContainer()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.shoppingButton.addSubview(countLabel)
        NSLayoutConstraint.activate([
            countLabel.leftAnchor.constraint(equalTo: shoppingButton.rightAnchor, constant: -7),
            countLabel.topAnchor.constraint(equalTo: shoppingButton.topAnchor, constant: 0),
            countLabel.widthAnchor.constraint(equalToConstant: .init((countLabel.text?.count ?? 0) * 5)),
            countLabel.heightAnchor.constraint(equalToConstant: 11)
        ])
        self.navigationItem.leftBarButtonItem = .init(customView: logoButton)
        self.navigationItem.rightBarButtonItems = [
            .init(customView: shoppingButton),
            .init(customView: walletButton)
        ]
        self.navigationController?.navigationBar.tintColor = .init(asset: WeShowIOSAsset.Color.gray600)
    }
}

// MARK: - Layout
extension HomeViewController {
    private func setupRootFlexContainer() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(rootFlexContainer)
        self.scrollView.pin.all(view.pin.safeArea)
        self.rootFlexContainer.pin.top().left().right()
        self.rootFlexContainer.flex.layout(mode: .adjustHeight)
        self.scrollView.contentSize = rootFlexContainer.frame.size
    }
    private func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(searchTextField).marginTop(15).height(50).marginHorizontal(24)
            flex.addItem(todaysInfoLabel).marginTop(25).marginLeft(24)
            flex.addItem(todaysInfoCollectionView).marginTop(10).marginLeft(24).right(0).height(140)

            flex.addItem(popularProductLabel).marginTop(26).marginLeft(24).direction(.row).define { flex in
                flex.addItem().grow(11)
                flex.addItem(allCategoryButton).grow(1)
                flex.addItem(dogCategoryButton).grow(1)
                flex.addItem(catCategoryButton).grow(1).marginRight(24)
            }

            flex.addItem(popularProductCollectionView).marginTop(24).height(313).marginHorizontal(24)
            flex.addItem(recommendLabel).marginTop(24).marginLeft(24)
            flex.addItem(recommendCollectionView).marginVertical(24).marginLeft(24).height(235)
        }
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private func setCollectionView() {
        self.todaysInfoCollectionView.delegate = self
        self.todaysInfoCollectionView.dataSource = self
        self.popularProductCollectionView.delegate = self
        self.popularProductCollectionView.dataSource = self
        self.recommendCollectionView.delegate = self
        self.recommendCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 11
        case 2:
            return self.view.frame.width / 30
        default:
            return 15
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 348, height: collectionView.frame.height)
        case 2:
            return CGSize(width: 105, height: 154)
        default:
            return CGSize(width: 210, height: 110)
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "informationCell",
                for: indexPath
            ) as? InformationCollectionViewCell
            cell?.setDemoData()
            return cell ?? UICollectionViewCell()
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "productCell",
                for: indexPath
            ) as? ProductCollectionViewCell
            cell?.setDemoData()
            return cell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "recommendProductCell",
                for: indexPath
            ) as? RecommendProductCollectionViewCell
            cell?.setDemoData()
            return cell ?? UICollectionViewCell()
        }
    }
}
