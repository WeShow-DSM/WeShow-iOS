import Foundation

import AuthService
import WeShowService
import Moya

enum OrderAPI {
    case fetchOrderList
}

extension OrderAPI: WeShowAPI {

    var domain: ApiDomain {
        return .order
    }

    var urlPath: String {
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var jwtType: JWTType? {
        return .accessToken
    }

}
