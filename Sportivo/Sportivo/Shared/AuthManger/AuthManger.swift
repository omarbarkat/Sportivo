//
//  AuthManger.swift
//  Sportivo
//
//  Created by eng.omar on 02/09/2024.
//

import Foundation
import FirebaseAuth
import UIKit

class AuthManger {
    static let shared = AuthManger()
    private init() {}
    
    func signIn(crad: AuthCredential, from viewController: UIViewController) {
        Auth.auth().signIn(with: crad) { result, error in
            guard let result = result, error == nil else {return}
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
                viewController.navigationController?.pushViewController(vc, animated: true)

            }
        }
    }
    func signOut() throws{
        try Auth.auth().signOut()
    }
    

}
