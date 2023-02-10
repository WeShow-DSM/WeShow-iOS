import Foundation

import KeychainSwift

public final class TokenLocalDataSourceImpl: TokenLocalDataSource {

    public static let shared = TokenLocalDataSourceImpl()

    private let keychainTask: TokenKeychainTask

    init() {
        self.keychainTask = TokenKeychainTask.shared
    }

    func registerAccessToken(accessToken: String) {
        self.keychainTask.register(tokenType: .accessToken, value: accessToken)
    }

    func registerRefreshToken(refreshToken: String) {
        self.keychainTask.register(tokenType: .refreshToken, value: refreshToken)
    }

    func fetchAccessToken() -> String? {
        self.keychainTask.fetch(tokenType: .accessToken)
    }

    func fetchRefreshToken() -> String? {
        self.keychainTask.fetch(tokenType: .refreshToken)
    }

    func deleteToken() {
        self.keychainTask.delete(tokenType: .accessToken)
        self.keychainTask.delete(tokenType: .refreshToken)
    }

}
