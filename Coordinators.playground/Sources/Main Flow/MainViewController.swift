import UIKit

class MainViewController: SimpleViewController, View {
    private(set) var viewModel: MainViewModel!
    private(set) var coordinator: MainCoordinator!

    func configure(_ coordinator: MainCoordinator, _ viewModel: MainViewModel) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelView)
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
        ])

        labelView.text = "Hello, \(viewModel.userName)."
    }
}
