//
//  ProductListView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

// TODO: List Product Screen (Test5b)

struct ProductListView: View {
    @StateObject var vm = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.loading {
                    CircularLoading()
                } else {
                    List(vm.products) { item in
                        HStack {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(item.productName).font(.headline)
                                Text(item.productDesc).font(.caption)
                                Text(item.productPrice.formatIDR()).font(.caption).bold()
                            }
                            
                            Spacer()
                            
                            URLImage(urlString: item.productImage, imageSize: 80)
                                .onAppear {
                                    vm.loadImage(for: item)
                                }
                        }.padding(.vertical, 10)
                    }
                    .listStyle(.plain)
                }
            }
            .task {
                await vm.fetchProducts()
            }
            .sheet(item: $vm.itemOpened) { item in
                ProductDetailView()
            }
            .navigationTitle("Products")
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
