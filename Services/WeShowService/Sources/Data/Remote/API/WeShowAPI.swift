import Foundation

import AuthService
import Moya

public protocol WeShowAPI: TargetType, JWTAuthorizable {
    var domain: ApiDomain { get }
    var urlPath: String { get }
}

public extension WeShowAPI {

    var baseURL: URL { URL(string: "http://43.201.76.81:8080")! }

    var path: String { domain.uri + urlPath }

    var task: Task { .requestPlain }

    var validationType: ValidationType { .successCodes }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

}
