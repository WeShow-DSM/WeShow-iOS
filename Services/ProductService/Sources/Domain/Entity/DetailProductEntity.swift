import Foundation

public struct DetailProductEntity: Equatable {
    public let images: [URL]
    public let title: String
    public let comment: String
    public let price: Int
    public let reviewCount: Int
    public let reviews: [ReviewEntity]
}
