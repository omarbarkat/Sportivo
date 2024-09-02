//
//  NetworkService.swift
//  Amtalek
//
//  Created by eng.omar on 31/08/2024.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String,method: HTTPMethod , parameters: [String: Any]?,headers:HTTPHeaders?  ,completion: @escaping ((Result<T, Error>)) -> Void)

}

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String,method: HTTPMethod , parameters: [String: Any]? ,headers:HTTPHeaders?  ,completion: @escaping ((Result<T, Error>)) -> Void) {
        AF.request(endpoint, method: method , parameters: parameters,encoding: JSONEncoding.default, headers:headers ).responseData { response in

              print(response.data)
              print(response)
              print(response.result)
              print(response.response)
              print(response.value)
              print(response.description)
              
              
              
              switch response.result {
              case .success(let data):
                  do {
                      let decodedObject: T = try Decoderr().decode(data: data)
                      completion(.success(decodedObject))
                      print(decodedObject)
                  } catch {
                      completion(.failure(error))

                  }
              case .failure(let error):
                  completion(.failure(error))

              }
          }
      }
}
struct VoidResponse: Decodable {}


