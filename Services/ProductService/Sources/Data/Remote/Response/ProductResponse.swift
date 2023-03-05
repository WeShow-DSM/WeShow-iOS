import Foundation

struct ProductResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case productImageUrlString = "product_image"
        case title
        case price
        case point
        case reviewCount = "review_count"
    }
    let id: Int
    let productImageUrlString: String
    let title: String
    let price: Int
    let point: Int
    let reviewCount: Int
}

extension ProductResponse {
    func toDomain() -> ProductEntity {
        return .init(
            id: id,
            productImageUrl: URL(string: productImageUrlString)!,
            title: title,
            price: price,
            point: point,
            reviewCount: reviewCount
        )
    }
}
