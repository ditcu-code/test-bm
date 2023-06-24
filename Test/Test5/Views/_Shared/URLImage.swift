//
//  URLImage.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import SwiftUI

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

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Male_and_female_chicken_sitting_together.jpg/180px-Male_and_female_chicken_sitting_together.jpg", imageSize: 150)
    }
}

