//
//  NetworkServiceType.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
import Combine

protocol NetworkServiceType {
    func setBaseUrl(_ baseUrl: String)
        
    func request<Response>(
        _ endpoint: NetworkRequest<Response>,
        queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response: Decodable
}
