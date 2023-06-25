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
                        NavigationLink {
                            ProductDetailView(productId: item.id, productName: item.productName)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(item.productName).font(.headline)
                                    Text(item.productDesc).font(.caption)
                                    Text(item.productPrice.formatIDR()).font(.caption).bold()
                                }.onAppear {
                                    vm.loadImage(for: item)
                                }
                                
                                Spacer()
                                
                                if let image = vm.loadedImages[item.id] {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                } else {
                                    Image("placeholder-food")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Products")
            .toolbar {
                Button {
                    vm.logout()
                } label: {
                    Label("Logout", systemImage: "arrow.left.square")
                        .foregroundColor(.pink.opacity(0.7))
                        .font(.footnote)
                        .labelStyle(.titleAndIcon)
                        .accessibilityIdentifier("logoutButton")
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
