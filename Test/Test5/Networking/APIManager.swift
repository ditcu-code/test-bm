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
}
