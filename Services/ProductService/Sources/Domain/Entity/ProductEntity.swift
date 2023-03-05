import Foundation

public struct ProductEntity: Equatable {
    public let id: Int
    public let productImageUrl: URL
    public let title: String
    public let price: Int
    public let point: Int
    public let reviewCount: Int
}
