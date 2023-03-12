import Foundation

struct OrderResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "product_id"
        case title
        case price
        case count
        case productImageUrlString = "product_image"
    }
    let id: Int
    let title: String
    let price: Int
    let count: Int
    let productImageUrlString: String
}

extension OrderResponse {
    func toDomain() -> OrderEntity {
        return .init(
            id: id,
            title: title,
            price: price,
            count: count,
            productImageUrl: URL(string: productImageUrlString)!
        )
    }
}
