//
//  Resolver+Extensions.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
import Resolver
@testable import MercadoPrueba
extension Resolver {
    static var mock = Resolver(child: .main)
        
    static func registerDataMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { MercadoServiceStub() }
            .implements(NetworkServiceType.self)
    }
    
    static func registerDomainMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { MercadoServiceStub() }
            .implements(MercadoPruebaRepositoryType.self)
    }
    
    static func registerPresentationMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { MylearningOwnViewSpy() }
        
        mock.register {
            GetProductsInteractorStub()
        }.implements(AnyInteractor<String?, [ProductObject]>.self)
        
        
    }
}
