import Foundation

public struct ProductListEntity: Equatable {
    public let todayProduct: String
    public let popularProduct: [ProductEntity]
    public let randomProduct: [ProductEntity]
}
