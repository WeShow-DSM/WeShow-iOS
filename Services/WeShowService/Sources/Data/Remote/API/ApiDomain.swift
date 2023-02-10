import Foundation

public enum ApiDomain: String {
    case user
    case product
    case order
    case review
    case point
    case profile
}

extension ApiDomain {
    var uri: String {
        return "/\(self.rawValue)"
    }
}
