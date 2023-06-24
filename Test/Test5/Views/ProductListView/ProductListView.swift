//
//  ProductListView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

// TODO: List Product Screen (Test5b)

struct ProductListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<5, id: \.self) {_ in
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Paket Kenyang 1").font(.headline)
                            Text("Nasi Goreng Spesial + Es Teh").font(.caption)
                            Text("28.000").font(.caption).bold()
                        }
                        
                        Spacer()
                        
                        Image("nasi-goreng")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding()
                    Divider().padding(.horizontal)
                }
            }.navigationTitle("Products")
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
