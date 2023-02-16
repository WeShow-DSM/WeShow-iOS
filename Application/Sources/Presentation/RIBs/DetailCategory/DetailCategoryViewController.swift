import RIBs
import RxSwift
import UIKit

import FlexLayout
import PinLayout
import Then

protocol DetailCategoryPresentableListener: AnyObject {
}

final class DetailCategoryViewController: UIViewController, DetailCategoryPresentable, DetailCategoryViewControllable {

    weak var listener: DetailCategoryPresentableListener?

    var categoryTitle: String = ""

    private let rootFlexContainer = UIView()

    // MARK: - UI
    private let categoryCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumInteritemSpacing = 15
            $0.minimumLineSpacing = 15
        }
    ).then {
        $0.backgroundColor = .clear
        $0.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.showsVerticalScrollIndicator = false
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(asset: WeShowIOSAsset.Color.gray100)
        self.setCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupLayoutWithFlex()
        self.setupRootFlexContainer()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = categoryTitle
        self.navigationController?.navigationBar.setBackButton()
    }
}

// MARK: - Layout
extension DetailCategoryViewController {
    func setupRootFlexContainer() {
        self.view.addSubview(rootFlexContainer)
        self.rootFlexContainer.pin.all(view.pin.safeArea)
        self.rootFlexContainer.flex.layout()
    }
    func setupLayoutWithFlex() {
        self.rootFlexContainer.flex.define { flex in
            flex.addItem(categoryCollectionView).height(view.frame.height).marginHorizontal(24).marginTop(5)
        }
    }
}

// MARK: - CollectionView
extension DetailCategoryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private func setCollectionView() {
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 105, height: 154)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? ProductCollectionViewCell
        cell?.setDemoData()
        return cell ?? UICollectionViewCell()
    }
}
