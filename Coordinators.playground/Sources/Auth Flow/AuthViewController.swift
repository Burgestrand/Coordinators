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
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
        ])
        stackView.axis = .vertical
        stackView.spacing = 10

        let textField = UITextField()
        stackView.addArrangedSubview(textField)
        self.userNameField = textField
        textField.placeholder = "User name"

        let button = UIButton(type: .custom)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.login), for: .primaryActionTriggered)
        stackView.addArrangedSubview(button)
    }

    func login() {
        if let user = viewModel.signIn(userName: userNameField.text) {
            coordinator.authenticationCompleted(user)
        } else {
            debugPrint("Failed to sign in!")
        }
    }
}
