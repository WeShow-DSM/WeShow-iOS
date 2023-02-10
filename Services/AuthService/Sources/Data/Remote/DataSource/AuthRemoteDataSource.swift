import Foundation

import RxSwift

protocol AuthRemoteDataSource {
    func signin(_ request: SigninRequest) -> Single<TokenResponse>
    func signup(_ request: SignupRequest) -> Completable
    func refreshToken() -> Single<TokenResponse>
}
