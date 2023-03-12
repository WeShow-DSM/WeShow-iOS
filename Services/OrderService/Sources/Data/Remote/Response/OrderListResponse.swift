import Foundation

struct OrderListResponse: Decodable {
    let orders: [OrderResponse]
}

extension OrderListResponse {
    func toDomain() -> [OrderEntity] {
        return orders.map { $0.toDomain() }
    }
}
