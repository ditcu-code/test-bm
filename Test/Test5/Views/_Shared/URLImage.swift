//
//  URLImage.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import SwiftUI

struct URLImage: View {
    let urlString: String

    let width: CGFloat?
    let height: CGFloat?
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        } placeholder: {
            Image("placeholder-food")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "https://adityacahyo.com/og.png", width: 150, height: 150)
    }
}

