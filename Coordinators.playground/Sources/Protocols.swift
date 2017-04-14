//: Interfaces

public protocol Coordinator: class {
    associatedtype State
    associatedtype Value
    associatedtype Root

    init(_ root: Root, completion: @escaping (Value) -> ())

    func start(_ state: State)
}

public extension Coordinator {
    init(_ root: Root) {
        self.init(root) { _ in }
    }
}

public protocol ViewModel: class {
}

public protocol View: class {
    associatedtype _Coordinator: Coordinator
    associatedtype _ViewModel: ViewModel

    // TODO:
    // weak var coordinator: _Coordinator! { get }
    // var viewModel: _ViewModel! { get }

    func configure(_ coordinator: _Coordinator, _ viewModel: _ViewModel)
}
