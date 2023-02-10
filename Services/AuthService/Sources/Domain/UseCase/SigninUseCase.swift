import Foundation

import RxSwift

public class SigninUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(id: String, password: String) -> Completable {
        return repository.signin(id: id, password: password)
    }

}
