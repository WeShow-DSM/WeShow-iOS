import Foundation

import Moya
import RxMoya
import RxSwift

final class AuthRemoteDataSourceImpl: AuthRemoteDataSource {

    private let provider = MoyaProvider<AuthAPI>(plugins: [JWTPlugin()])
    private let tokenLocalDataSource: TokenLocalDataSource

    init(tokenLocalDataSource: TokenLocalDataSource) {
        self.tokenLocalDataSource = tokenLocalDataSource
    }

    func signin(_ request: SigninRequest) -> Single<TokenResponse> {
        return provider.rx.request(.signin(request))
            .map(TokenResponse.self)
    }

    func signup(_ request: SignupRequest) -> Completable {
        return provider.rx.request(.signup(request))
            .asCompletable()
    }

    func refreshToken() -> Single<TokenResponse> {
        let refreshToken = tokenLocalDataSource.fetchRefreshToken() ?? ""
        return provider.rx.request(.refresh(refreshToken))
            .map(TokenResponse.self)
    }

}
