import UIKit

public class AppCoordinator: Coordinator {
    enum Flow {
        case tutorial(TutorialCoordinator)
        case auth(AuthCoordinator)
        case main(MainCoordinator)
    }

    public enum State {
        case firstLaunch
        case auth
        case main(userName: String)
    }

    private let window: UIWindow

    required public init(_ window: UIWindow, completion: @escaping (Void) -> ()) {
        self.window = window
    }

    var current: Flow!
    var state: State! {
        didSet {
            guard let state = state else {
                preconditionFailure()
            }

            switch state {
            case .firstLaunch:
                let coordinator = TutorialCoordinator(window) { [unowned self] tutorialCompleted in
                    debugPrint("Tutorial completed", tutorialCompleted)
                    self.state = .auth
                }
                current = .tutorial(coordinator)
                coordinator.start()
            case .auth:
                let coordinator = AuthCoordinator(window) { [unowned self] userName in
                    self.state = .main(userName: userName)
                    debugPrint("User signed in", userName)
                }
                current = .auth(coordinator)
                coordinator.start()
            case .main(userName: let userName):
                let coordinator = MainCoordinator(window) { [unowned self] _ in
                    self.state = .auth
                    fatalError("Sign out not yet implemented.")
                }
                current = .main(coordinator)
                coordinator.start(userName)
            }
        }
    }

    public func start(_ state: State = .firstLaunch) {
        self.state = state
        window.makeKeyAndVisible()
    }
}
