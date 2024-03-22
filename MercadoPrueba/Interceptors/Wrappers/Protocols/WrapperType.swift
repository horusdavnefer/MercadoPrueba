//
//  WrapperType.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation

protocol WrapperType {
    associatedtype Input
    associatedtype Output
    
    static func map(input: Input) -> Output
}
