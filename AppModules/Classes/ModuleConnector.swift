import Foundation

public protocol ModuleConnectorType: class {
    func mount(module: ModuleType)

    func get(url: URL) -> Any?

    func respondsTo(urlScheme: String) -> Bool
}

public class ModuleConnector: ModuleConnectorType {
    var routes: [String: ModuleType] = [:]

    public init() {}

    public func mount(module: ModuleType) {
        module.urlSchemes.forEach {
            self.routes[$0] = module
        }
    }

    public func get(url: URL) -> Any? {
        guard let scheme = url.scheme,
            let module = self.routes[scheme] else { return nil }

        return module.get(url: url)
    }

    public func respondsTo(urlScheme: String) -> Bool {
        return routes.keys.contains(urlScheme)
    }
}
