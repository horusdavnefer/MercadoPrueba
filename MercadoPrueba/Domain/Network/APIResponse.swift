//
//  APIResponse.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
struct APIResponse<T : Codable> : Codable {
    let site_id: String
    let query: String
    let results: [APIProductObject]
    let responseError: APIError?
}
