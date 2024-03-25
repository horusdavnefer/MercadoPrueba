//
//  BaseViewModelProtocol.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation

protocol BaseViewModelProtocol {
    
    var view: BaseView? {get set}
    
    func bind(withView view: BaseView)
    func unBind()
    func viewAppear()
    func viewDidAppear()
    func getInitialState()
}
 
