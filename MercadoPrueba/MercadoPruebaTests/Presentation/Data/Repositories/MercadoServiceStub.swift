//
//  MercadoServiceStub.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Combine
import Foundation
@testable import MercadoPrueba

final class MercadoServiceStub {
    static var error: Error?
    static var response: Codable!
    static var responseEmpty: Codable?
}

extension MercadoServiceStub: NetworkServiceType {
    func setBaseUrl(_ baseUrl: String) {}

    func request<Response>(_ endpoint: NetworkRequest<Response>,
                           queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response: Decodable
    {
        let data = MercadoServiceStub.response ?? MercadoServiceStub.responseEmpty

        let publisher = CurrentValueSubject<Response, Error>(data as! Response)

        if let error = MercadoServiceStub.error {
            publisher.send(completion: .failure(error))
        }

        return publisher.eraseToAnyPublisher()
    }
}
