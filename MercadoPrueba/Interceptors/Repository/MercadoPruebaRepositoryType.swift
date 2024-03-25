//
//  MercadoPruebaRepositoryType.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
import Combine
protocol MercadoPruebaRepositoryType {
    func getMercadoPruebaProducts(by query: String) -> AnyPublisher<[ProductObject], Error>
    /*func getCategories() -> AnyPublisher<CategoriesObject, Error>
    func getBenefits(by categoryId: Int) -> AnyPublisher<BenefitsObject, Error>
    func getBenefitsExist() -> AnyPublisher<Bool, Error>
    func getCodeBenefit(by couponId: Int) -> AnyPublisher<CodeObject, Error>*/
}
