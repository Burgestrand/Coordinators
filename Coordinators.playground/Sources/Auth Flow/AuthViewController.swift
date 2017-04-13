import UIKit

class AuthViewController: SimpleViewController, View {
    private(set) var viewModel: AuthViewModel!
    private(set) var coordinator: AuthCoordinator!

    func configure(_ coordinator: AuthCoordinator, _ viewModel: AuthViewModel) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    weak var userNameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        let textField = UITextField()
        stackView.addArrangedSubview(textField)
        self.userNameField = UITextField()
        textField.placeholder = "User name"

        let button = UIButton(type: .custom)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.login), for: .primaryActionTriggered)
        stackView.addSubview(button)
    }

    func login() {
        debugPrint("Sign in", userNameField.text ?? "<N/A>")
    }
}
