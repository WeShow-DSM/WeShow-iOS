import Foundation

struct ReviewResponse: Decodable {
    let id: Int
    let nick: String
    let comment: String
}

extension ReviewResponse {
    func toDomain() -> ReviewEntity {
        return .init(
            id: id,
            nick: nick,
            comment: comment
        )
    }
}
