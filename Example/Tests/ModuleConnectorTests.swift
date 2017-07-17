import Foundation
import Quick
import Nimble

@testable import AppModules

class ModuleConnectorTests: QuickSpec {
    override func spec() {
        it("mounts a module") {
            let moduleConnector = ModuleConnector()
            moduleConnector.mount(module: MockModule(connector: moduleConnector))

            let mockModule = moduleConnector.routes.values.first {
                $0 is MockModule
            }

            expect(mockModule).notTo(beNil())
        }

        it("returns nil on get when no module is mounted") {
            let moduleConnector = ModuleConnector()

            guard let url = URL(string: "notmock://whatever") else { XCTFail(); return }
            let result = moduleConnector.get(url: url)

            expect(result).to(beNil())
        }

        it("routes get requests to the appropriate module") {
            let moduleConnector = ModuleConnector()
            let mockModule = MockModule(connector: moduleConnector)
            let mockModule2 = MockModule(connector: moduleConnector)
            mockModule2.urlSchemes = ["mock2"]

            moduleConnector.mount(module: mockModule)
            moduleConnector.mount(module: mockModule2)

            guard let url = URL(string: "\(mockModule.urlSchemes[0])://whatever") else { XCTFail(); return }
            let result = moduleConnector.get(url: url)

            expect(mockModule.getCount).to(equal(1))
            expect(mockModule2.getCount).to(equal(0))
            expect(result as? String).to(equal(mockModule.moduleResource as? String))
        }

        it("correctly reports valid url schemes") {
            let moduleConnector = ModuleConnector()
            let mockModule = MockModule(connector: moduleConnector)

            moduleConnector.mount(module: mockModule)

            let result = moduleConnector.respondsTo(urlScheme: mockModule.urlSchemes[0])

            expect(result).to(beTrue())
        }
    }
}
