//
//  MercadoPruebaContract.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation
protocol MercadoViewModelType: ObservableObject {
    var state: MercadoPruebaState { get set }
    func onAppear()
    func onDisAppear()
    func showProductDetailView(product: ProductObject?)
    func getProductsbyString(_ query: String)
}

protocol MercadoViewType {
    func showMercadoDetailView()
}
