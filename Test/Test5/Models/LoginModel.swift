//
//  LoginModel.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Foundation

struct LoginResponse: Decodable {
    var responseCode: Int
    var responseDesc: String
    var data: User
    
    struct User: Decodable {
        var name, job: String
    }
}

