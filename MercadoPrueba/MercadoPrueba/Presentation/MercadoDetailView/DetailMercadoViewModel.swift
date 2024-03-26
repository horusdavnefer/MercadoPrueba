//
//  DetailMercadoViewModel.swift
//  MercadoPrueba
//
//  Created by iMac on 24/03/24.
//

import Combine
import Resolver
import Foundation
import SystemConfiguration
import SwiftUI

final class DetailMercadoViewModel: BaseViewModel {
    @Published var state = DetailMercadoState()
    
    //@Injected var getCodeForBenefitInteractor: AnyInteractor<Int, CodeObject>
    
    struct InputDependencies {
        let detailMercadoData: DetailMercadoData
    }
    private var subscribers: Set<AnyCancellable> = []
    
    private let dependencies: InputDependencies
    var detailMercadoData: DetailMercadoData
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
        detailMercadoData = dependencies.detailMercadoData
        super.init()
        setupDetailBenefit()
    }
    
    private func setupDetailBenefit() {
        state.product = detailMercadoData.product
        state.isLoading = false
        objectWillChange.send()
    }
    
   
    
}

extension DetailMercadoViewModel: DetailMercadoViewModelType {
    
    
    func onAppear() {}
    
    func onDisAppear() {}
    
    func isComplete() {}
    
    func noComplete() {}
    
}
