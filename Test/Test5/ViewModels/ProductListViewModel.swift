//
//  ProductListViewModel.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Alamofire
import SwiftUI

class ProductListViewModel: ObservableObject {
    @Published var products: [ProductResponse.Product] = []
    @Published var itemOpened: ProductResponse.Product?
    @Published var loadedImages: [Int: UIImage] = [:]
    
    @Published var loading: Bool = false
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    @MainActor
    func fetchProducts() async {
        self.loading = true

        AF.request("https://aci-test.bmsecure.id/test/product").responseDecodable(of: ProductResponse.self, decoder: decoder) { response in
            switch response.result {
            case .success(let productResponse):
                self.products = productResponse.data
                self.loading = false
            case .failure(let error):
                print("Error fetching products: \(error)")
                self.loading = false
            }
        }
    }
    
    func loadImage(for product: ProductResponse.Product) {
        guard loadedImages[product.productId] == nil else {
            return // Image already loaded
        }
        
        guard let url = URL(string: product.productImage) else {
            return // Invalid image URL
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return // Error loading image
            }
            
            DispatchQueue.main.async {
                self.loadedImages[product.productId] = image
            }
        }.resume()
    }

}
