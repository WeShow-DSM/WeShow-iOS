import RIBs

protocol CheckDeliveryInteractable: Interactable {
    var router: CheckDeliveryRouting? { get set }
    var listener: CheckDeliveryListener? { get set }
}

protocol CheckDeliveryViewControllable: ViewControllable {
}

// swiftlint:disable line_length
final class CheckDeliveryRouter: ViewableRouter<CheckDeliveryInteractable, CheckDeliveryViewControllable>, CheckDeliveryRouting {
    override init(interactor: CheckDeliveryInteractable, viewController: CheckDeliveryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
