import UIKit

public class AuthCoordinator: Coordinator {
    let root: UIWindow
    let completion: (String) -> ()

    public required init(_ root: UIWindow, completion: @escaping (String) -> ()) {
        self.root = root
        self.completion = completion
    }

    public func start() {
        debugPrint("Start auth")
        let vc = AuthViewController()
        let vm = AuthViewModel()
        vc.configure(self, vm)
        vc.title = "Auth"
        root.rootViewController = vc
    }

    // View interface.

    func authenticationCompleted(_ userName: String) {
        completion(userName)
    }
}
