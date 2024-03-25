//
//  MercadoPruebaRepository.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
import Combine

class MercadoPruebaRepository: MercadoPruebaRepositoryType {
    
    private(set) var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    
    
    func getMercadoPruebaProducts(by query: String) -> AnyPublisher<[ProductObject], Error> {
        let endPoint = NetworkRequest<APIResponse<[APIProductObject]>>(
            method: .GET,
            relativePath: DataConstants.MercadoPruebaService.searchProduct + query,
            parameters: nil)
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { MercadoWrapper.map(input: $0.results) }
            .eraseToAnyPublisher()
    }
    
    
    
}
