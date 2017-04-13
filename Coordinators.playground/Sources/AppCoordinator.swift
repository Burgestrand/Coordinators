import UIKit

public class AppCoordinator: Coordinator {
    enum Flow {
        case tutorial(TutorialCoordinator)
        //        case auth(AuthCoordinator)
        //        case main(MainCoordinator)
    }

    let window: UIWindow

    required public init(_ window: UIWindow, completion: @escaping (Void) -> ()) {
        self.window = window
    }

    var userName: String?
    var current: Flow!

    public func start() {
        if let userName = userName {
            fatalError("NO")
        } else {
            let tutorial = TutorialCoordinator(window) { _ in }
            tutorial.start()
        }

        window.makeKeyAndVisible()
    }
}
