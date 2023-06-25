//
//  ProductDetailViewModel.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    @Published var loading: Bool = false
    
    private let apiManager = APIManager.shared
    
    func fetchProductDetail(id: Int) {
        loading = true
        
        apiManager.fetchProductDetail(id: id) { [weak self] product, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.loading = false
                
                if let error = error {
                    print("Error fetching products: \(error)")
                } else if let product = product {
                    self.product = product
                }
            }
        }
    }
    
}
