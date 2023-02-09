import Foundation

import RxSwift

protocol AuthRepository {
    func signin(id: String, password: String) -> Completable
    func singup(id: String, password: String, nickname: String) -> Completable
    func refreshToken() -> Completable
}
