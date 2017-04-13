import UIKit

class TutorialViewController: SimpleViewController, View {
    private(set) var viewModel: Void!
    private(set) var coordinator: TutorialCoordinator!

    func configure(_ coordinator: TutorialCoordinator, _ viewModel: Void) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .custom)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.skip), for: .primaryActionTriggered)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
        ])
    }

    func skip() {
        // NOTE: if viewModel.someLogic { … }
        coordinator.skipTutorial()
    }
}
