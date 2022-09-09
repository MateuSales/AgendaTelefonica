import CoreData
import UIKit

enum HomeFactory {
    static func make() -> UIViewController {
        guard let database = DatabaseCoreData(container: NSPersistentContainer(name: "Contact")) else {
            fatalError("Database not created")
            return UIViewController()
        }
        
        let homeViewController = HomeViewController(database: database)
        let navigationController = UINavigationController(rootViewController: homeViewController)

        return navigationController
    }
}
