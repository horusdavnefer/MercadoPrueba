//
//  String+Extension.swift
//  MercadoPrueba
//
//  Created by iMac on 25/03/24.
//

import Foundation

extension String {
    static func formatAmount(_ amount: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "es_CO") //en_GB en_US es_ES
        currencyFormatter.numberStyle = .currency
         
        if let formattedAmount = currencyFormatter.string(from: NSNumber(value: amount)) {
            return formattedAmount
        } else {
            return "n/a"
        }
    }
}
