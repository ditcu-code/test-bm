//
//  ProductListViewModel.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Alamofire
import SwiftUI

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var loadedImages: [Int: UIImage] = [:]
    
    @Published var loading: Bool = false
    
    private let apiManager = APIManager.shared
    
    init() {
        if products.isEmpty {
            fetchProducts()
        }
    }
    
    func fetchProducts() {
        loading = true
        
        apiManager.fetchProducts { [weak self] products, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.loading = false
                
                if let error = error {
                    print("Error fetching products: \(error)")
                } else if let products = products {
                    self.products = products
                }
            }
        }
    }
    
    func loadImage(for product: Product) {
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
