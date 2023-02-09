import Foundation

import AuthService
import Moya
import RxMoya
import RxSwift
import Swinject

public class WeShowRemoteDataSource<API: WeShowAPI> {

    private let provider = MoyaProvider<API>(plugins: [JWTPlugin()])
    private let tokenLocalDataSource = TokenLocalDataSourceImpl.shared
    private let refreshTokenUseCase: RefreshTokenUseCase

    public init() {
        self.refreshTokenUseCase = Container().resolve(RefreshTokenUseCase.self)!
    }

    public func request(_ api: API) -> Single<Response> {
        return Single<Response>.create { single in
            var disposables = [Disposable]()
            if api.jwtType == JWTType.none {
                disposables.append(
                    self.defaultRequest(api).subscribe(
                        onSuccess: { single(.success($0)) },
                        onFailure: { single(.failure($0)) }
                    )
                )
            } else {
                disposables.append(
                    self.requestWithAccessToken(api).subscribe(
                        onSuccess: { single(.success($0)) },
                        onFailure: { single(.failure($0)) }
                    )
                )
            }
            return Disposables.create()
        }
    }
}

private extension WeShowRemoteDataSource {
    func defaultRequest(_ api: API) -> Single<Response> {
        return provider.rx.request(api)
            .timeout(.seconds(5), scheduler: MainScheduler.asyncInstance)
            .catch { error in
                guard let moyaError = error as? MoyaError else { return Single.error(error) }
                return Single.error(moyaError)
            }
    }
    func requestWithAccessToken(_ api: API) -> Single<Response> {
        return Single.deferred {
            self.defaultRequest(api)
                .catch { error in
                    let error = error as? MoyaError
                    if error?.response?.statusCode == 401 {
                        self.refreshToken().subscribe { _ in }.dispose()
                    }
                    return .error(error!)
                }
        }
        .retry(1)
    }
}

private extension WeShowRemoteDataSource {
    func refreshToken() -> Completable {
        return self.refreshTokenUseCase.excute()
    }
}
