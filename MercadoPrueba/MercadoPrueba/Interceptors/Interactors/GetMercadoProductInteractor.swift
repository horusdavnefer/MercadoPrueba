//
//  GetMercadoProductInteractor.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation
import Combine

class GetMercadoProductInteractor: AnyInteractor<String?, [ProductObject]> {
    
    let repository: MercadoPruebaRepositoryType
    
    init(repository: MercadoPruebaRepositoryType) {
        self.repository = repository
    }
    
    override func execute(params: String?) -> AnyPublisher<[ProductObject], Error> {
        return repository.getMercadoPruebaProducts(by: params!)
    }
    
}

