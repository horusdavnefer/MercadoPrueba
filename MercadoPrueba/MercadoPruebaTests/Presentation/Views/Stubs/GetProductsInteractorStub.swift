//
//  GetProductsInteractorStub.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Combine
import Foundation
@testable import MercadoPrueba

class GetProductsInteractorStub: AnyInteractor<String?, [ProductObject]> {
    static var productObject:[ProductObject]?
    static var error: Error?

    override func execute(params: String?) -> AnyPublisher<[ProductObject], Error> {
        let publisher = CurrentValueSubject<[ProductObject], Error>(GetProductsInteractorStub.productObject!)

        if let error = GetProductsInteractorStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
