//
//  DetailMercadoViewModelType.swift
//  MercadoPrueba
//
//  Created by iMac on 24/03/24.
//

import SwiftUI

protocol DetailMercadoViewModelType: ObservableObject, Identifiable {
    var state: DetailMercadoState {get set}
    var detailMercadoData: DetailMercadoData {get set}
    
    
    func onAppear()
    func onDisAppear()
    
    func isComplete()
    func noComplete()
}
