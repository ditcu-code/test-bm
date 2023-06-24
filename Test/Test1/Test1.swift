//
//  Test1.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

struct Test1: View {
    let size: Int = 5
    let numberOfBoxes: Int = 2
    
    var body: some View {
        VStack(spacing: 50) {
            ForEach(0..<numberOfBoxes, id:\.self) {_ in
                BinaryBox(size: size) // Create BinaryBox view with a size of 5
            }
        }
    }
}

fileprivate struct BinaryBox: View {
    var size: Int
    
    // Function to generate a random binary number of the specified length
    private func generateRandomBinary(length: Int) -> String {
        let randomBits = (0..<length).map { _ in String(arc4random_uniform(2)) }
        return randomBits.joined()
    }
    
    var body: some View {
        VStack {
            ForEach(0..<size, id: \.self) {_ in
                Text(generateRandomBinary(length: size))
            }
        }
    }
}

struct Test1_Previews: PreviewProvider {
    static var previews: some View {
        Test1()
    }
}
