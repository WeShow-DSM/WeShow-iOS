import Foundation

struct ProductListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case todayProduct = "today_product"
        case popularProduct = "popular_product"
        case randomProduct = "random_product"
    }
    let todayProduct: String
    let popularProduct: [ProductResponse]
    let randomProduct: [ProductResponse]
}

extension ProductListResponse {
    func toDomain() -> ProductListEntity {
        return .init(
            todayProduct: todayProduct,
            popularProduct: popularProduct.map { $0.toDomain() },
            randomProduct: randomProduct.map { $0.toDomain() }
        )
    }
}
