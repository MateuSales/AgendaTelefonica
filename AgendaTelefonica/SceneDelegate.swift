import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScenne = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScenne)
        window?.rootViewController = HomeFactory.make()
        window?.makeKeyAndVisible()
    }
}

