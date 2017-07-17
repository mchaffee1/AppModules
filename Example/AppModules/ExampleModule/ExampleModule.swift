import Foundation
import AppModules

public class ExampleModule: ModuleType {
    public let urlSchemes = ["example"]

    public func get(url: URL) -> Any? {
        let storyboard = UIStoryboard(name: "ExampleModuleView", bundle: nil)
        let exampleViewController = storyboard.instantiateInitialViewController()
        return exampleViewController
    }
}
