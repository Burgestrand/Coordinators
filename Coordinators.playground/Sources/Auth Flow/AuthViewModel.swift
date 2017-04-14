import Foundation

class AuthViewModel: ViewModel {
    typealias User = String

    func signIn(userName: String?) -> User? {
        guard let userName = userName else {
            return nil
        }

        return userName
    }
}
