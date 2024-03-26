//
//  Resolver+Extensions.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import Foundation
import Resolver

extension Resolver {
    static var mock = Resolver(child: .main)
        
    /*static func registerDataMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { BenefitsServiceStub() }
            .implements(NetworkServiceType.self)
    }
    
    static func registerDomainMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { BenefitsRepositoryStub() }
            .implements(BenefitsRepositoryType.self)
    }
    
    static func registerPresentationMock() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register { MylearningOwnViewSpy() }
        
        mock.register {
            GetBenefitsGalleryInteractorStub()
        }.implements(AnyInteractor<Any?, BenefitsGalleryObject>.self)
        
        mock.register {
            GetCategoriesInteractorStub()
        }.implements(AnyInteractor<Any?, CategoriesObject>.self)
        
        mock.register {
            GetBenefitsByCategoryInteractorStub()
        }.implements(AnyInteractor<Int, BenefitsObject>.self)
    }*/
}
