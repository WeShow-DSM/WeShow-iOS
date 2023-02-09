import Foundation

import Swinject

public extension Container {

    func registerAuthSereviceDependency() {
        registerAuthRepository()
        registerAuthUseCase()
    }

    private func registerAuthRepository() {
        self.register(TokenLocalDataSource.self) { _ in TokenLocalDataSourceImpl.shared }
        self.register(AuthRemoteDataSource.self) { resolver in
            AuthRemoteDataSourceImpl(tokenLocalDataSource: resolver.resolve(TokenLocalDataSource.self)!)
        }
        self.register(AuthRepository.self) { resolver in
            AuthRepositoryImpl(
                tokenLocalDataSource: resolver.resolve(TokenLocalDataSource.self)!,
                remoteDataSource: resolver.resolve(AuthRemoteDataSource.self)!
            )
        }
    }
    private func registerAuthUseCase() {
        self.register(SigninUseCase.self) { resolver in
            SigninUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }
        self.register(SignupUseCase.self) { resolver in
            SignupUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }
        self.register(RefreshTokenUseCase.self) { resolver in
            RefreshTokenUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }
    }
}
