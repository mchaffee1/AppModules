import Foundation

public protocol ModuleType {
    var urlSchemes: [String] { get }

    func get(url: URL) -> Any?
}
