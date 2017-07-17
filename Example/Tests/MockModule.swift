import Foundation

@testable import AppModules

class MockModule: ModuleType {
    var urlSchemes = ["mock"]

    required init(connector: ModuleConnectorType) {    }

    var moduleResource: Any = "mockModuleResource"
    var getCount = 0
    func get(url: URL) -> Any? {
        getCount += 1
        return self.moduleResource
    }
}
