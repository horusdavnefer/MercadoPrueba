//
//  MercadoViewModelTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
import Resolver
import XCTest
@testable import MercadoPrueba

final class BenefitsViewModelTest: XCTestCase {
    private var sut: MercadoViewModel!
    
    override func setUp() {
        super.setUp()
        Resolver.registerPresentationMock()
        let dependencies = MercadoViewModel.InputDependencies(
            ownView: Resolver.resolve(MylearningOwnViewSpy.self)
        )
        sut = MercadoViewModel(dependencies: dependencies)
    }
    
    override func tearDown() {
        GetProductsInteractorStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSuccess_ThenchangeStateIsLoadingWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get products test")
        GetProductsInteractorStub.productObject = DataTestConstants.apiProductsObject
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.isLoading)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenReturnFailure_ThenchangeStateIsLoadingWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get products test")
        GetProductsInteractorStub.error = NetworkError.emptyJson
        GetProductsInteractorStub.productObject = DataTestConstants.apiProductsObject
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.isLoading)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenchangeStateLoadingWasChanged() {
        // When
        sut.onDisAppear()
        
        // Then
        XCTAssertFalse(sut.loading)
    }
    
   
    
   
}
