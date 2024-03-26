//
//  DetailBenefitViewModelTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
@testable import MercadoPrueba
import XCTest

final class DetailBenefitViewModelTest: XCTestCase {
    private var sut: DetailMercadoViewModel!
    
    override func setUp() {
        super.setUp()
        let dependencies = DetailMercadoViewModel.InputDependencies(
            detailMercadoData: .init(product: DataTestConstants.productObject))
        sut = DetailMercadoViewModel(dependencies: dependencies)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenThereIsChangeState_ThenchangeStatebenefitWasChanged() {
        // When
        sut.onAppear()
        
        // Then
        XCTAssertNotNil(sut.state.product)
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenchangeStateLoadingWasChanged() {
        // When
        sut.onDisAppear()
        
        // Then
        XCTAssertFalse(sut.loading)
    }
    
}
