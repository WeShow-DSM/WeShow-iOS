import Foundation

struct SigninRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case id = "account_id"
        case password
    }
    let id: String
    let password: String
}
