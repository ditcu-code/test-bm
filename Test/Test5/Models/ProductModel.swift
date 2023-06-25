//
//  ProductListModel.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Foundation

struct ProductsResponse: Decodable {
    var responseCode: Int
    var responseDesc: String
    var data: [Product]
}

struct ProductDetailResponse: Decodable {
    var responseCode: Int
    var responseDesc: String
    var data: Product
}

struct Product: Decodable, Identifiable {
    var productId: Int
    var productName: String
    var productImage: String
    var productDesc: String
    var productPrice: Int
    
    var id: Int {
        return productId
    }
}
