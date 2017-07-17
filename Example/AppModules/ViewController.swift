import UIKit
import AppModules

class ViewController: UIViewController {

    let moduleConnector = ModuleConnector()

    override func viewDidLoad() {
        super.viewDidLoad()

        moduleConnector.mount(module: ExampleModule())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadBtn_touchUpInside(_ sender: Any) {
        guard let url = URL(string: "example://something") ,
            let viewController = moduleConnector.get(url: url) as? UIViewController
            else { return }

        navigationController?.pushViewController(viewController, animated: true)
    }
}

