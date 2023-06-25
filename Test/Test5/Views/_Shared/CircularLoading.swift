//
//  CircularLoading.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

struct CircularLoading: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }
}

struct CircularLoading_Previews: PreviewProvider {
    static var previews: some View {
        CircularLoading()
    }
}
