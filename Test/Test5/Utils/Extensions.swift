//
//  Extensions.swift
//  Test
//
//  Created by Aditya Cahyo on 25/06/23.
//

import Foundation

extension Int {
    func formatIDR() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "id_ID") // Set locale to Indonesian

        return numberFormatter.string(from: NSNumber(value: self)) ?? "-"
    }
}
