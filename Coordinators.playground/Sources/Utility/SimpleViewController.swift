import UIKit

open class SimpleViewController: UIViewController {
    override open func viewDidLoad() {
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

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        debugPrint("VC \(title ?? "N/A") will appear.")
    }
}
