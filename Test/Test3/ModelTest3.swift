//
//  Profile.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import Foundation

struct Profile: Codable {
    var firstName: String
    var lastName: String
    var gender: String
    var age: Int
    var address: Address
    var phoneNumbers: [PhoneNumber]
    var status: String
    
    struct Address: Codable {
        var streetAddress: String
        var city: String
        var state: String
        var postalCode: String
    }

    struct PhoneNumber: Codable {
        var type: String
        var number: String
    }
}
