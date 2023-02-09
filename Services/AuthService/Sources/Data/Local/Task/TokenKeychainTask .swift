import Foundation

import KeychainSwift

enum KeychainTokenType: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
}

final class TokenKeychainTask {

    static let shared = TokenKeychainTask()
    private let keychainSwift = KeychainSwift()

    private init() { }

    func register(tokenType: KeychainTokenType, value: String) {
        self.keychainSwift.set(value, forKey: tokenType.rawValue)
    }

    func fetch(tokenType: KeychainTokenType) -> String? {
        self.keychainSwift.delete(tokenType.rawValue)
        return self.keychainSwift.get(tokenType.rawValue)
    }

    func delete(tokenType: KeychainTokenType) {
        self.keychainSwift.delete(tokenType.rawValue)
    }

}
