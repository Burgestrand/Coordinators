import UIKit

public class MainCoordinator: Coordinator {
    let root: UIWindow
    let completion: (String) -> ()

    public required init(_ root: UIWindow, completion: @escaping (String) -> ()) {
        self.root = root
        self.completion = completion
    }

    public func start(_ userName: String) {
        debugPrint("Start auth")
        let vc = MainViewController()
        let vm = MainViewModel(userName)
        vc.configure(self, vm)
        vc.title = "Main"
        root.rootViewController = vc
    }

    // View interface.

    func authenticationCompleted(_ userName: String) {
        completion(userName)
    }
}
