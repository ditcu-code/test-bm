//
//  ContentView.swift
//  Test
//
//  Created by ACI on 23/08/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            ProductListView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
