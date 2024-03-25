//
//  MercadoPruebaState.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation


final class MercadoPruebaState: ObservableObject {
    
    @Published var mercadoPruebaObjects: [ProductObject] = []
    @Published var searchText:String = ""

    @Published var isLoading: Bool = false
    @Published var numberSkeletonCell: Int = 4
    @Published var numberSkeletonCellBenefit: Int = 4
    @Published var cellType: CellType = .horizontal
    @Published var selectedTab: Int = 0
    @Published var showError: Bool = false
    @Published var pruebaErrorType: PruebaErrorType?

}
