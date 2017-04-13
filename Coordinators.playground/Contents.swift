import PlaygroundSupport
import Foundation
import UIKit

protocol Coordinator: class {
    associatedtype Value
    associatedtype Root

    init(_ root: Root, completion: @escaping (Value) -> ())

    func start()
}

class AppCoordinator {
    enum Flow {
        case tutorial(TutorialCoordinator)
        //        case auth(AuthCoordinator)
        //        case main(MainCoordinator)
    }

    let window: UIWindow

    init(_ window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }

    var userName: String?
    var current: Flow!

    func start() {
        if let userName = userName {
            fatalError("NO")
        } else {
            let tutorial = TutorialCoordinator(window) { _ in }
            tutorial.start()
        }
    }
}

class TutorialCoordinator {
    let root: UIWindow
    let completion: (Void) -> ()

    init(_ root: UIWindow, completion: @escaping (Void) -> ()) {
        self.root = root
        self.completion = completion
    }

    func start() {
        let vc = TutorialViewController()
        vc.title = "Tutorial"
        root.rootViewController = vc
    }
}

class SimpleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title ?? "N/A"
        label.textColor = .black
        view.addSubview(label)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            ])

        view.backgroundColor = .white
    }
}

class TutorialViewController: SimpleViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .custom)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            ])
    }
}

class AppDelegate {
    var coordinator: AppCoordinator!

    func applicationDidFinishLaunching() -> UIWindow {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        coordinator = AppCoordinator(window)
        coordinator.start()
        return window
    }
}

// Start!
let delegate = AppDelegate()

PlaygroundPage.current.liveView = delegate.applicationDidFinishLaunching()
