import Foundation

public struct OrderEntity: Equatable {
    public let id: Int
    public let title: String
    public let price: Int
    public let count: Int
    public let productImageUrl: URL
}
