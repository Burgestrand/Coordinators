import UIKit

public class AppDelegate {
    var coordinator: AppCoordinator!

    public init() {
    }

    public func applicationDidFinishLaunching() -> UIWindow {
        let window = UIWindow()
        coordinator = AppCoordinator(window)
        coordinator.start()
        return window
    }
}
