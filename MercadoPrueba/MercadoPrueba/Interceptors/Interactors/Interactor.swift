//
//  Interactor.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation
import Combine
protocol Interactorable {
    associatedtype Response
    associatedtype Params

    func execute(params: Params) -> AnyPublisher<Response, Error>
}

open class AnyInteractor<Input, Output>: Interactorable {
    typealias Response = Output
    typealias Params = Input

    func execute(params: Input) -> AnyPublisher<Output, Error> {
        fatalError("This method must be implemented")
    }
}
