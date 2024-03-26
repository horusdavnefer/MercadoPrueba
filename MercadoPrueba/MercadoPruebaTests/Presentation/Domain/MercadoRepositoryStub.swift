//
//  MercadoRepositoryStub.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
import Combine
@testable import MercadoPrueba

final class MercadoRepositoryStub {
    static var error: Error?
    static var productsObjects: [ProductObject]?
    static var benefitsExistResponse: Bool?
}

extension MercadoRepositoryStub: MercadoPruebaRepositoryType {
    func getMercadoPruebaProducts(by query: String) -> AnyPublisher<[ProductObject], Error> {
        let data = MercadoRepositoryStub.productsObjects ?? nil
        
        let publisher = CurrentValueSubject<[ProductObject], Error>(data!)
        
        if let error = MercadoRepositoryStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
}
