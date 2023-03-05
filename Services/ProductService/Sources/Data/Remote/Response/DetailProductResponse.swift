import Foundation

struct DetailProductResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case images
        case title
        case comment
        case price
        case reviewCount = "review_count"
        case reviews
    }
    let images: [String]
    let title: String
    let comment: String
    let price: Int
    let reviewCount: Int
    let reviews: [ReviewResponse]
}

extension DetailProductResponse {
    func toDomain() -> DetailProductEntity {
        return .init(
            images: images.map { URL(string: $0)! },
            title: title,
            comment: comment,
            price: price,
            reviewCount: reviewCount,
            reviews: reviews.map { $0.toDomain() }
        )
    }
}
