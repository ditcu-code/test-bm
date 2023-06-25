//
//  ProductDetailView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

// TODO: Detail Product Screen

struct ProductDetailView: View {
    @StateObject private var vm = ProductDetailViewModel()
    
    let productId: Int
    let productName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if let item = vm.product {
                URLImage(
                    urlString: item.productImage,
                    width: UIScreen.main.bounds.width - 20, height: nil
                )
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.productDesc).font(.caption)
                    Text(item.productPrice.formatIDR()).font(.caption).bold()
                }.padding(.top)
                Spacer()
            }
        }
        .onAppear {
            if vm.product == nil {
                vm.fetchProductDetail(id: productId)
            }
        }
        .navigationTitle(productName)
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productId: 1, productName: "Ayam")
    }
}
