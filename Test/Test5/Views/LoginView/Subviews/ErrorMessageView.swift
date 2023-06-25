//
//  ErrorMessageView.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

struct ErrorMessageView: View {
    var message: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text(message)
            Spacer()
        }
        .foregroundColor(.pink.opacity(0.75))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.pink.opacity(0.1))
        )
        .transition(.move(edge: .bottom))
    }
}


struct ErrorMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessageView(message: "Error")
    }
}
