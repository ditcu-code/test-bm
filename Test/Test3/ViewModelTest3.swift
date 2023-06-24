//
//  ViewModelTest3.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import Foundation

class ViewModelTest3: ObservableObject {
    @Published private (set) var status = ""
    
    private let dataDummy = "{\"firstName\": \"John\",\"lastName\": \"Smith\",\"gender\": \"man\",\"age\": 32,\"address\": {\"streetAddress\": \"21 2nd Street\",\"city\": \"New York\",\"state\": \"NY\",\"postalCode\": \"10021\"},\"phoneNumbers\": [{ \"type\": \"home\", \"number\": \"212 555-1234\" },{ \"type\": \"fax\", \"number\": \"646 555-4567\" }],\"status\": \"Test3 selesai :)\"}".data(using: .utf8)!
    
    /*
     
     struktur json data dummy :
     {
         "firstName": "John",
         "lastName": "Smith",
         "gender": "man",
         "age": 32,
         "address": {
             "streetAddress": "21 2nd Street",
             "city": "New York",
             "state": "NY",
             "postalCode": "10021"
         },
         "phoneNumbers": [
            {
                "type": "home",
                "number": "212 555-1234"
            },
            {
                "type": "fax",
                "number": "646 555-4567"
            }
         ],
         "status": "Test3 selesai :)"
     }
     
     */
    
    func dummyUrlRequest() {
        if let result = try? JSONDecoder().decode(Profile.self, from: dataDummy) {
            status = result.status
        } else {
            status = "Masih error :("
        }
    }
}
