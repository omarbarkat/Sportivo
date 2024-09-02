//
//  APIParameters.swift
//  GamePlay
//
//  Created by eng.omar on 18/08/2024.
//

import Foundation
import Alamofire

enum headers {
    case normal
    
    var headers: HTTPHeaders  {
        switch self {
        case .normal:
            return [
                "X-Shopify-Access-Token": "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",
                          "Content-Type": "application/json"
            ]
        }
    }
    
}

enum APIParameters {
    case normal
    case signUp(firstName: String, lastName: String, Email: String , password: String, phoneNumber: String)
    
    var paramters: [String: Any] {
        switch self {
        case .normal:
            return [
                         "normal": "normal",
                         "APIkey": "f12bc43e02c5027510c08d70c38e1cf1dc65ea050ae3eaa2c2ebb3a29334dcfc"
                     ]
        case .signUp(let firstName , let lastName, let Email, let password, let phoneNumber):
//            let phoneNumber = "+20" + (phoneNumber ?? "")

            return
                [
                    "customer": [
                        "first_name": firstName ?? "",
                        "last_name": lastName ?? "",
                        "email": Email ?? "",
                        "phone":   phoneNumber,
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
                        "password": password ?? "",
                        "password_confirmation": password ?? "",
                        "send_email_welcome": false
                    ]
                ]
            
     
      
       
        }
    }
}
