import Foundation

import RxSwift

final class AuthRepositoryImpl: AuthRepository {

    private let tokenLocalDataSource: TokenLocalDataSource
    private let remoteDataSource: AuthRemoteDataSource

    init(
        tokenLocalDataSource: TokenLocalDataSource,
        remoteDataSource: AuthRemoteDataSource
    ) {
        self.tokenLocalDataSource = tokenLocalDataSource
        self.remoteDataSource = remoteDataSource
    }

    func signin(id: String, password: String) -> Completable {
        return self.remoteDataSource.signin(.init(id: id, password: password))
            .map { token in
                self.tokenLocalDataSource.registerAccessToken(accessToken: token.accessToken)
                self.tokenLocalDataSource.registerRefreshToken(refreshToken: token.refreshToken)
            }
            .asCompletable()
    }

    func singup(id: String, password: String, nickname: String) -> Completable {
        return self.remoteDataSource.signup(.init(id: id, password: password, nickname: nickname))
    }

    func refreshToken() -> Completable {
        return self.remoteDataSource.refreshToken()
            .map { token in
                self.tokenLocalDataSource.registerAccessToken(accessToken: token.accessToken)
                self.tokenLocalDataSource.registerRefreshToken(refreshToken: token.refreshToken)
            }
            .asCompletable()
    }

}
