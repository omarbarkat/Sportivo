//
//  AppCoordinator.swift
//  Sportivo
//
//  Created by marwa maky on 31/08/2024.
//
import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties

    let window: UIWindow?
  
    lazy var navigationController: UINavigationController = {
        let navController = UINavigationController()
        return navController
    }()
    
    var firstViewController: SignUpVC?
    
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let firstVC = storyboard.instantiateViewController(withIdentifier: "firstViewController") as? SignUpVC {
            firstViewController = firstVC
            firstViewController?.coordinator = self

            navigationController.viewControllers = [firstVC]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()

        }

    }

    override func finish() {
    }
    // extentions to add func nav
    
}
