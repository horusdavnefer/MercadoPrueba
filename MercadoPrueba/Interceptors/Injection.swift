//
//  Injection.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
import Resolver

extension Resolver {
    static func registerMercadoPruebaModuleDependencies(with baseUrl: String) {
        registerDataMercadoPruebaDependencies(with: baseUrl)
        registerDomainMercadoDependencies()
    }
}

extension Resolver {
    static func registerDataMercadoPruebaDependencies(with baseUrl: String) {
        register {
            URLSession(configuration: URLSession.configuration())
        }
        
        register {
            NetworkService(url: baseUrl, urlSession: resolve(URLSession.self))
        }.implements(NetworkServiceType.self)
        
        register {
            MercadoPruebaRepository(networkService: resolve(NetworkServiceType.self))
        }.implements(MercadoPruebaRepositoryType.self)
    }
    static func registerDomainMercadoDependencies() {
        
        register {
            GetMercadoProductInteractor(repository: resolve(MercadoPruebaRepositoryType.self))
        }.implements(AnyInteractor<String?,  [ProductObject]>.self)
        
        register {
            MercadoNavigationView()
        }.implements(MercadoViewType.self)
        
        register(MercadoViewModel.self) { _ in
            let dependencies = MercadoViewModel.InputDependencies(ownView: resolve(MercadoViewType.self))
            return MercadoViewModel(dependencies: dependencies)
        }
        
    }
    static func registerPresentationDetailProductViewDependencies(product: DetailMercadoData) {
        register(DetailMercadoViewModel.self) { _ in
            let dependencies = DetailMercadoViewModel.InputDependencies(detailMercadoData: product)
            return DetailMercadoViewModel(dependencies: dependencies)
        }
    }
}


