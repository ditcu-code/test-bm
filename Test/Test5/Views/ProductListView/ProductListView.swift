//
//  ProductListView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI
import Alamofire

// TODO: List Product Screen (Test5b)

struct ProductResponse: Decodable {
    var responseCode: Int
    var responseDesc: String
    var data: [Product]
    
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
}

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

extension Int {
    func formatIDR() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "id_ID") // Set locale to Indonesian

        return numberFormatter.string(from: NSNumber(value: self)) ?? "-"
    }
}

struct URLImage: View {
    let urlString: String
    let imageSize: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        } placeholder: {
            Image("placeholder-food")
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}
