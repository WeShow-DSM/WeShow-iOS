import Foundation

import Moya

enum AuthAPI {
    case signin(_ reuqest: SigninRequest)
    case signup(_ reuqest: SignupRequest)
    case refresh(_ refreshToken: String)
}

extension AuthAPI: TargetType {

    var baseURL: URL { URL(string: "http://43.201.76.81:8080")! }

    var path: String {
        switch self {
        case .signin:
            return "/user/sign"
        case .signup:
            return "/user/signup"
        case .refresh:
            return "/user/refresh"
        }
    }

    var method: Moya.Method {
        switch self {
        case .refresh:
            return .put
        default:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .signin(let request):
            return .requestJSONEncodable(request)
        case .signup(let request):
            return .requestJSONEncodable(request)
        default:
            return .requestPlain
        }
    }

    var validationType: ValidationType { .successCodes }

    var headers: [String: String]? {
        switch self {
        case .refresh(let refreshToken):
            return ["Authorization": "Bearer \(refreshToken)"]
        default:
            return ["Content-Type": "application/json"]
        }
    }

}
