//
//  SignUpViewModel.swift
//  Sportivo
//
//  Created by eng.omar on 02/09/2024.
//

import Foundation
import Alamofire



class SignUpViewModel {
    var networkService: NetworkService?
    
    init() {
        networkService = NetworkService()
    }
    
    func signUp(params: [String: Any], headers: HTTPHeaders) {
        let url = "https://nciost1.myshopify.com/admin/api/2024-07/customers.json"
        networkService?.request(url, method: .post, parameters: params, headers: headers) {(result: Result<User, Error>) in
            print(result)
        }
    }
}
