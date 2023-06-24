//
//  LoginViewModel.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var via: String = ""
    
    @Published var loading: Bool = false
    @Published var errorMessage: String = ""
    
}
