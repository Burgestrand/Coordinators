import UIKit

public class AppCoordinator: Coordinator {
    enum Flow {
        case tutorial(TutorialCoordinator)
        case auth(AuthCoordinator)
        //        case main(MainCoordinator)

        func start() {
            switch self {
            case .tutorial(let coordinator):
                coordinator.start()
            case .auth(let coordinator):
                coordinator.start()
            }
        }
    }

    private let window: UIWindow
    var current: Flow! {
        didSet {
            debugPrint(current)
            current.start()
        }
    }

    required public init(_ window: UIWindow, completion: @escaping (Void) -> ()) {
        self.window = window
    }

    // App state
    var firstLaunch = true
    var userName: String?

    public func start() {
        current = nextFlow()
        window.makeKeyAndVisible()
    }

    private func nextFlow() -> Flow {
        if firstLaunch {
            firstLaunch = false
            let coordinator = TutorialCoordinator(window) { [unowned self] tutorialCompleted in
                debugPrint("Tutorial completed", tutorialCompleted)
                self.current = self.nextFlow()
            }
            return .tutorial(coordinator)
        } else {
            let coordinator = AuthCoordinator(window) { [unowned self] userName in
                debugPrint("User signed in", userName)
            }
            return .auth(coordinator)
        }
    }
}
