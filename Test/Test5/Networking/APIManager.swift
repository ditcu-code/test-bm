//
//  APIManager.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private let baseUrl = "https://aci-test.bmsecure.id/test"
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func login(parameters: [String: Any], completion: @escaping (LoginResponse?, Error?, String?) -> Void) {
        AF.request("\(baseUrl)/login", method: .post, parameters: parameters)
            .responseDecodable(of: LoginResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let loginResponse):
                    completion(loginResponse, nil, nil)
                    //                case .failure(let error):
                    //                    completion(nil, error)
                case .failure(let error):
                    let statusCode = response.response?.statusCode ?? 0
                    let errorDescription = self.getErrorDescription(from: response.data)
                    completion(nil, error, errorDescription)
                }
            }
    }
    
    func fetchProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        AF.request("\(baseUrl)/product")
            .responseDecodable(of: ProductsResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let productResponse):
                    completion(productResponse.data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    func fetchProductDetail(id: Int, completion: @escaping (Product?, Error?) -> Void) {
        AF.request("\(baseUrl)/product?id=\(id)")
            .responseDecodable(of: ProductDetailResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let productResponse):
                    completion(productResponse.data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    private func getErrorDescription(from data: Data?) async -> String? {
        guard let data1 = data else {
            return nil
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data1, options: []) as? [String: Any]
            return json?["response_desc"] as? String
        } catch {
            print("Error parsing error response: \(error)")
            return nil
        }
    }
}
