import UIKit

extension UITextField {
    func addImageToLeft(_ image: UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        leftimage.image = image
        leftimage.tintColor = .init(asset: WeShowIOSAsset.Color.gray400)
        leftimage.contentMode = .scaleAspectFill

        let continaerView = UIView(frame: CGRect(x: 0, y: 0, width: 30 + 2 * 10, height: 30))
        continaerView.addSubview(leftimage)
        self.leftView = continaerView
        self.leftViewMode = .always
    }
}
