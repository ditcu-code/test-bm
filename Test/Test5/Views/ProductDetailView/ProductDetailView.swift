//
//  ProductDetailView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

// TODO: Detail Product Screen

struct ProductDetailView: View {
    let widthImage = UIScreen.main.bounds.width - 20
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("nasi-goreng")
                .resizable()
                .scaledToFill()
                .frame(width: widthImage, height: widthImage)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading, spacing: 10) {
                Text("Paket Kenyang 1").font(.headline)
                Text("Nasi Goreng Spesial + Es Teh").font(.caption)
                Text("28.000").font(.caption).bold()
            }.padding(.top)
        }.padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
