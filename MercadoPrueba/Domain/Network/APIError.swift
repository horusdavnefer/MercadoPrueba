//
//  APIError.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation

struct APIError: Codable {
    var message: String?
    var description: String?

    init(message: String?,
         description: String?) {
        self.message = message
        self.description = description
    }
}
