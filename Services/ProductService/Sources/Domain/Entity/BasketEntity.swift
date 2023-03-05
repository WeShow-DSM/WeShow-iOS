import Foundation

public struct BasketEntity: Equatable {
    public let products: [ProductEntity]
    public let totalPrice: Int
}
