import Foundation

struct ProductsResponse: Decodable {
    let products: [ProductResponse]
}

extension ProductsResponse {
    func toDomain() -> [ProductEntity] {
        return products.map { $0.toDomain() }
    }
}
