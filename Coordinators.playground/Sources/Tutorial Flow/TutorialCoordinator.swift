import UIKit

public class TutorialCoordinator: Coordinator {
    let root: UIWindow
    let completion: (Bool) -> ()

    public required init(_ root: UIWindow, completion: @escaping (Bool) -> ()) {
        self.root = root
        self.completion = completion
    }

    public func start() {
        let vc = TutorialViewController()
        vc.configure(self)
        vc.title = "Tutorial"
        root.rootViewController = vc
    }

    // View interface.

    func skipTutorial() {
        debugPrint("User wants to skip tutorial!")
        completion(false)
    }

    func completeTutorial() {
        debugPrint("User completed tutorial!")
        completion(true)
    }
}
