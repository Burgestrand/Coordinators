//: Interfaces

public protocol Coordinator: class {
    associatedtype Value
    associatedtype Root

    init(_ root: Root, completion: @escaping (Value) -> ())

    func start()
}

public extension Coordinator {
    init(_ root: Root) {
        self.init(root) { _ in }
    }
}
