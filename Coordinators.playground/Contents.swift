import PlaygroundSupport
import Foundation
import UIKit

class AppDelegate {
    var coordinator: AppCoordinator!

    func applicationDidFinishLaunching() -> UIWindow {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        coordinator = AppCoordinator(window)
        coordinator.start()
        return window
    }
}

let delegate = AppDelegate()
let window = delegate.applicationDidFinishLaunching()

PlaygroundPage.current.liveView = window