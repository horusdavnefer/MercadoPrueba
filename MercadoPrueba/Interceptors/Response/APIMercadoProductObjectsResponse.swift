//
//  APIMercadoProductObjectsResponse.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation

struct APIMercadoProductObjectsResponse:Codable {
    var mercadoProductObject: [APIProductObject]?

    init(mercadoProductObject: [APIProductObject]?) {
        self.mercadoProductObject = mercadoProductObject
    }
}
