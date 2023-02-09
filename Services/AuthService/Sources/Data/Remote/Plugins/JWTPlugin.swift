import Foundation

import Moya
import RxSwift

public protocol JWTAuthorizable {
    var jwtType: JWTType? { get }
}

public enum JWTType {
    case none
    case accessToken
    case refreshToken

    var headerString: String? {
        switch self {
        case .none:
            return nil
        default:
            return "Authorization"
        }
    }
}

public final class JWTPlugin: PluginType {

    private let tokenLocalDataSource: TokenLocalDataSource

    public init() {
        self.tokenLocalDataSource = TokenLocalDataSourceImpl.shared
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? JWTAuthorizable,
              let tokenType = authorizable.jwtType,
              tokenType != .none
        else { return request }

        var request = request

        let authValue = "Bearer \(getToken(tokenType) ?? "")"
        request.addValue(authValue, forHTTPHeaderField: tokenType.headerString!)
        return request

    }
}

extension JWTPlugin {
    private func getToken(_ type: JWTType) -> String? {
        switch type {
        case .none:
            return nil
        case .accessToken:
            return fetchAccessToken()
        case .refreshToken:
            return fetchRefreshToken()
        }
    }

    private func fetchAccessToken() -> String? {
        self.tokenLocalDataSource.fetchAccessToken()
    }
    private func fetchRefreshToken() -> String? {
        self.tokenLocalDataSource.fetchRefreshToken()
    }

}
