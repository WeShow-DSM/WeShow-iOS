import Foundation

import Moya
import WeShowService
import AuthService

enum ProductAPI {
    case fetchProductList
    case fetchDetailProduct(id: Int)
    case searchCategory(category: CategoryType)
    case searchTitle(title: String)
    case takeProductInBasket(productId: Int, count: Int)
    case fetchBasket
    case order(products: [Int])
}

extension ProductAPI: WeShowAPI {

    var domain: WeShowService.ApiDomain {
        return .product
    }

    var urlPath: String {
        switch self {
        case .fetchDetailProduct(let id):
            return "/\(id)"
        case .searchCategory(let category):
            return "/category/\(category.rawValue)"
        case .searchTitle(let title):
            return "/search/\(title)"
        case .takeProductInBasket(let productId, let count):
            return "/\(productId)/\(count)"
        case .fetchBasket:
            return "/basket"
        case .order:
            return "/order"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .takeProductInBasket, .order:
            return .post
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .order(let products):
            return .requestParameters(
                parameters: [
                    "products": products
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var jwtType: JWTType? {
        return .accessToken
    }
    
    
}
