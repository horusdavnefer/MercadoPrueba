//
//  APIResponse.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
struct APIResponse<T : Codable> : Codable {
    let responseCode: Int
    let responseStatus: Bool
    let responseSuccess: T
    let responseError: APIError?
}
