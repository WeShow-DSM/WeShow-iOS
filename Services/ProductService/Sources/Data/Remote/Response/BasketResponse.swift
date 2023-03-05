import Foundation

struct BasketResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case products
        case totalPrice = "total_price"
    }
    let products: [ProductResponse]
    let totalPrice: Int
}

extension BasketResponse {
    func toDomain() -> BasketEntity {
        return .init(
            products: products.map { $0.toDomain() },
            totalPrice: totalPrice
        )
    }
}
