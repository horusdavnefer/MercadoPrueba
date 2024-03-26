//
//  GetProductByStringInteractorTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Combine
import Resolver
@testable import MercadoPrueba
import XCTest

class GetProductByStringInteractorTest: XCTestCase {
    private var sut: GetMercadoProductInteractor!
    private var cancellable: AnyCancellable?
    private let query = "xbox"
    
    override func setUpWithError() throws {
        Resolver.registerDomainMock()
        sut = .init(repository: Resolver.resolve(MercadoPruebaRepositoryType.self))
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellable = nil
        MercadoRepositoryStub.error = nil
        MercadoRepositoryStub.productsObjects = nil
        MercadoRepositoryStub.benefitsExistResponse = nil
    }
    
    func testGetProductByStringInteractor_ThenResponseSuccess() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "execute interactor response expectation")
        expectationFailure.isInverted = true
        MercadoRepositoryStub.productsObjects = DataTestConstants.apiProductsObject
        
        // When
        cancellable = sut.execute(params: query)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            }, receiveValue: { response in
                // Then
                XCTAssertFalse(response.isEmpty )
                expectation.fulfill()
            })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    func testGetProductByStringInteractor_ResponseFailure() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "execute interactor response expectation")
        expectation.isInverted = true
        MercadoRepositoryStub.error = NetworkError.emptyJson
        
        // When
        cancellable = sut.execute(params: query)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else {
                    return XCTFail("completion failure")
                }
                // Then
                let jsonEmptyError = NetworkError.emptyJson.localizedDescription
                XCTAssertEqual(error.localizedDescription, jsonEmptyError)
                expectationFailure.fulfill()
            }, receiveValue: { _ in
                expectation.fulfill()
            })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
}

