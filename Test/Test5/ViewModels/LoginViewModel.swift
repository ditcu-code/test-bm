//
//  LoginViewModel.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = "aci"
    @Published var password: String = "akucintaindonesia"
    @Published var via: String = "ios"
    
    @Published var name: String?
    @Published var loading: Bool = false
    @Published var errorMessage: String = ""
    
    private let apiManager = APIManager.shared
    
    func login() {
        let body: [String : Any] = ["username" : username, "password" : password, "via" : via]
        
        apiManager.login(parameters: body) { [weak self] user, error, errorDesc in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.loading = false
                
                if let errorDesc = errorDesc {
                    self.errorMessage = errorDesc
                } else if let user = user {
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    self.name = user.data.name
                    self.errorMessage = ""
                }
            }
        }
    }
}
