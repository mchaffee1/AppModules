import Foundation
import Quick
import Nimble
import AppModules

@testable import AppModules_Example

class ExampleModuleTests: QuickSpec {
    override func spec() {
        it("returns a view controller on get()") {
            let module = ExampleModule()

            guard let url = URL(string: "example://anything") else { XCTFail(); return }
            let result = module.get(url: url) as? NSObject

            expect(result).to(beAKindOf(ExampleViewController.self))
        }
    }
}
