//
//  firstViewController.swift
//  Sportivo
//
//  Created by marwa maky on 31/08/2024.
//

import UIKit
import Alamofire
import GoogleSignIn
import FirebaseAuth



class SignUpVC: UIViewController {
    
    var viewModel: SignUpViewModel?
    
    //Outlets:
    //imgs:
    @IBOutlet weak var imgLastNameValid: UIImageView!
    @IBOutlet weak var imgPasswordValid: UIImageView!
    @IBOutlet weak var imgEmailValid: UIImageView!
    @IBOutlet weak var imgNameValid: UIImageView!
    //textFields:
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    //Buttons:
    @IBOutlet weak var btnGoogleSignIn: GIDSignInButton!
    
    @IBOutlet weak var NavTitle: UINavigationItem!
    @IBOutlet weak var googleView: ShadowView!
    var coordinator: AppCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignUpViewModel()
        setupUI()
        googleSignIncomfig()
        
        btnGoogleSignIn.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
  
        
        
        
        
        txtFirstName.text = "omar"
        txtLastName.text = "omar"
        txtEmail.text = "omar@gmail.com"
        txtPassword.text = "123456789"
        txtPhoneNumber.text = "+201192639862"
        
        
        
        
        
        
        

    }
    func signUp() {
        let phoneNumber = "+20" + (txtPhoneNumber.text ?? "")
//
        let parameters: [String: Any] = [
            "customer": [
                "first_name": txtFirstName.text ?? "",
                "last_name": txtLastName.text ?? "",
                "email": txtEmail.text ?? "",
                "phone":   txtPhoneNumber.text ?? "",
                "verified_email": true,
//                "addresses": [
//                    [
//                        "address1": "123 Oak St",
//                        "city": "Ottawa",
//                        "province": "ON",
//                        "phone": "555-1212",
//                        "zip": "123 ABC",
//                        "last_name": "Lastnameson",
//                        "first_name": "Mother",
//                        "country": "CA"
//                    ]
//                ],
                "password": txtPassword.text ?? "",
                "password_confirmation": txtPassword.text ?? "",
                "send_email_welcome": false
            ]
        ]
//
//        let url = "https://nciost1.myshopify.com/admin/api/2024-07/customers.json"
        let headers: HTTPHeaders = [
            "X-Shopify-Access-Token": "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",
                      "Content-Type": "application/json"
        ]
        viewModel?.signUp(params: parameters, headers: headers)

//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//                print(response)
//                switch response.result {
//                case .success(let value):
//                    print("Success with JSON: \(value)")
//                case .failure(let error):
//                    print("Error: \(error)")
//                }
//            }

    }
    
    
    private func validateData() -> Bool {
        guard txtPhoneNumber.validateEmpty() else {return false}
        guard txtFirstName.validateEmpty() else {return false}
        guard txtEmail.validateEmail()else {return false}
        guard txtPassword.validatePassword() else {return false}
        guard txtLastName.validateEmpty() else {return false}
        return true
    }
    
    //Actions:
    @IBAction func btnGoToSignIn(_ sender: Any) {
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        guard validateData() else {return}
        // here sign up function
        signUp()
    }
    //UILogic:
    @objc
    func didTapSignIn() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) {[weak self] result, error in
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString,
            let strongSelf = self  else {
                print("eeror in google sign in ")
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            AuthManger.shared.signIn(crad: credential, from: self!)
        }
    }
    
    @objc
    func txtNameValidation(_ textField: UITextField) {
        if let text = textField.text, text.count > 3 {
            imgNameValid.isHidden = false
        } else {
            imgNameValid.isHidden = true
        }
    }
    @objc
    func txtEmailValidation(_ textField: UITextField) {
        if let text = textField.text, text.count > 3 {
            imgEmailValid.isHidden = false
        } else {
            imgEmailValid.isHidden = true
        }
    }
    @objc
    func txtPasswordValidation(_ textField: UITextField) {
        if let text = textField.text, text.count > 7 {
            imgPasswordValid.isHidden = false
        } else {
            imgPasswordValid.isHidden = true
        }
    }
    @objc
    func txtLastNameValidation(_ textField: UITextField) {
        if let text = textField.text, text.count > 3 {
            imgLastNameValid.isHidden = false
        } else {
            imgLastNameValid.isHidden = true
        }
    }
    func setupUI() {
        googleView.layer.cornerRadius = 25
        imgNameValid.isHidden = true
        imgEmailValid.isHidden = true
        imgPasswordValid.isHidden = true
        imgLastNameValid.isHidden = true
        txtFirstName.addTarget(self, action: #selector(txtNameValidation(_:)), for: .editingChanged)
        txtEmail.addTarget(self, action: #selector(txtEmailValidation(_:)), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(txtPasswordValidation(_:)), for: .editingChanged)
        txtLastName.addTarget(self, action: #selector(txtLastNameValidation(_:)), for: .editingChanged)
    }
    
    private func googleSignIncomfig() {
         let clientID = "410877791536-9qfv9nm0t438s1u5ql91lclpran62s0e.apps.googleusercontent.com"
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
}
