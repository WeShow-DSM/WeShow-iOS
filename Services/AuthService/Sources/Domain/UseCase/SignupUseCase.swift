import Foundation

import RxSwift

public class SignupUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(id: String, password: String, nickname: String) -> Completable {
        return repository.singup(id: id, password: password, nickname: nickname)
    }

}
