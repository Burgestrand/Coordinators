import UIKit

/// Maybe this VC don't want a ViewModel? But protocol says we MUST!
class TutorialViewModel: ViewModel {
}

class TutorialViewController: SimpleViewController, View {
    private(set) var coordinator: TutorialCoordinator!

    func configure(_ coordinator: TutorialCoordinator, _ viewModel: TutorialViewModel = TutorialViewModel()) {
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
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
        ])
    }

    func skip() {
        // NOTE: if viewModel.someLogic { … }
        coordinator.skipTutorial()
    }
}
