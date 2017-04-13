import UIKit

public class AppDelegate {
    var coordinator: AppCoordinator!

    public init() {
    }

    public func applicationDidFinishLaunching() -> UIWindow {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        coordinator = AppCoordinator(window)
        coordinator.start()
        return window
    }
}
