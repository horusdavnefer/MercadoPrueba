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
    
    
    
    func getMercadoPruebaProducts(by query: String) -> AnyPublisher<MercadoPagoObject, Error> {
        let endPoint = NetworkRequest<APIResponse<APIMercadoPagoObjectResponse>>(
            method: .GET,
            relativePath: DataConstants.MercadoPruebaService.searchProduct + query,
            parameters: nil)
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { MercadoWrapper.map(input: $0.responseSuccess) }
            .eraseToAnyPublisher()
    }
    /*
    func getCategories() -> AnyPublisher<CategoriesObject, Error> {
        let endPoint = NetworkRequest<APIResponse<APICategoryResponse>>(
            method: .GET,
            relativePath: DataConstants.BenefitsService.categories,
            parameters: nil)
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { CategoryWrapper.map(input: $0.responseSuccess) }
            .eraseToAnyPublisher()
    }
    
    func getBenefits(by categoryId: Int) -> AnyPublisher<BenefitsObject, Error> {
        var parameters: [String: Int]? = nil
        var relativePath = DataConstants.BenefitsService.benefitsAll
        if categoryId != BenefitsRepository.allCategoryId {
            parameters = [
                "categoryId": categoryId
            ]
            relativePath = DataConstants.BenefitsService.benefitsCategory
        }
        
        let endPoint = NetworkRequest<APIResponse<APIBenefitResponse>>(
            method: .GET,
            relativePath: relativePath,
            parameters: parameters)
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { BenefitWrapper.map(input: $0.responseSuccess) }
            .eraseToAnyPublisher()
    }
    
    func getBenefitsExist() -> AnyPublisher<Bool, Error> {
        
        let endPoint = NetworkRequest<APIResponse<APIBenefitsExistResponse>>(
            method: .GET,
            relativePath: DataConstants.BenefitsService.benefitsExist,
            parameters: nil)
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { BenefitsExistWrapper.map(input: $0.responseSuccess) }
            .eraseToAnyPublisher()
        
    }
    
    func getCodeBenefit(by couponId: Int) -> AnyPublisher<CodeObject, Error> {
        
        let preference = Preferences()
        
        let parameters: [String: Any] = [
            "email" : preference.getEmail(),
            "username": preference.getUserName(),
            "telephone": preference.getPhone()
        ]
        
        
        let endPoint = NetworkRequest<APIResponse<APIBenefitsCodeResponse>>(
            method: .POST,
            relativePath: "\(DataConstants.BenefitsService.codeBenefit)?couponId=\(couponId)",
            parameters: parameters )

        return networkService.request(endPoint,
                                      queue: .main)
        .map { BenefitsCodeWrapper.map(input: $0.responseSuccess) }
            .eraseToAnyPublisher()
    }*/
    
    
}
