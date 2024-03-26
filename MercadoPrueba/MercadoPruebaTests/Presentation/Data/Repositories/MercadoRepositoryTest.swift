//
//  MercadoRepositoryTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Combine
import Resolver
@testable import MercadoPrueba
import XCTest

final class MercadoRepositoryTest: XCTestCase {
    private var cancellable: AnyCancellable?
    private var sut: MercadoPruebaRepositoryType!
    private let categoryId = 12
    override func setUpWithError() throws {
        Resolver.registerDataMock()
        sut = MercadoPruebaRepository(networkService: Resolver.resolve(NetworkServiceType.self))
    }
    
    override func tearDown() {
        sut = nil
        cancellable = nil
        MercadoServiceStub.error = nil
        MercadoServiceStub.response = nil
        MercadoServiceStub.responseEmpty = nil
        super.tearDown()
    }
    
    func testGetProducts_ResponseSuccess() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "execute interactor response expectation")
        expectationFailure.isInverted = true
        MercadoServiceStub.response = APIResponse<[APIProductObject]>(
            site_id: "sds",
            query: "Xbox", 
            results: DataTestConstants.apiProductsObjectResponse,
            responseError: nil
        )
        
        // When
        cancellable = sut.getMercadoPruebaProducts(by: "xbox")
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            }, receiveValue: { response in
                // Then
                XCTAssertFalse(response.isEmpty ?? true)
                expectation.fulfill()
            })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    func testGetProducts_ResponseFailure() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "execute interactor response expectation")
        expectation.isInverted = true
        MercadoServiceStub.error = NetworkError.emptyJson
        MercadoServiceStub.responseEmpty = APIResponse<[APIProductObject]>(
            site_id: "sds",
            query: "Xbox",
            results: DataTestConstants.apiProductsObjectResponse,
            responseError: nil
        )
        
        // When
        cancellable = sut.getMercadoPruebaProducts(by: "xbox")
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return XCTFail("completion failure") }
                // Then
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            }, receiveValue: { _ in
                expectation.fulfill()
            })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    
    
}
