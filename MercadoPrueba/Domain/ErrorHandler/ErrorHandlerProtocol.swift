//
//  ErrorHandlerProtocol.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
protocol ErrorHandlerProtocol: AnyObject {
    func showConnectivityError()
    func hideConnectivityError()
}
