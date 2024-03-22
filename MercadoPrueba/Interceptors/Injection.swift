//
//  Injection.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation

import Resolver

extension Resolver {
    static func registerMercadoPruebaModuleDependencies(with baseUrl: String, apikey: String) {
        registerDataMercadoPruebaDependencies(with: baseUrl, apikey: apikey)
        //registerDomainBenefitsDependencies()
        //registerPresentationBenefitsViewDependencies()
    }
}

extension Resolver {
    static func registerDataMercadoPruebaDependencies(with baseUrl: String, apikey: String) {
        register {
            URLSession(configuration: URLSession.configuration())
        }
        
        register {
            NetworkService(url: baseUrl, apiKey: apikey, urlSession: resolve(URLSession.self))
        }.implements(NetworkServiceType.self)
        
        register {
            MercadoPruebaRepository(networkService: resolve(NetworkServiceType.self))
        }.implements(MercadoPruebaRepositoryType.self)
    }
}
