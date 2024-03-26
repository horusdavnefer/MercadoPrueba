//
//  NetworkServiceTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//
import Combine
@testable import MercadoPrueba
import XCTest

class NetworkServiceTest: XCTestCase {
    private var cancellable: AnyCancellable?
    private var sut: NetworkServiceType!
    private var urlSession: URLSession!
    static let baseUrl = "https://www.google.com"
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        urlSession = URLSession(configuration: configuration)
        sut = NetworkService(
            url: NetworkServiceTest.baseUrl,
            urlSession: urlSession
        )
    }
    
    override func tearDownWithError() throws {
        sut = nil
        URLProtocolMock.testUrl = [:]
        URLProtocolMock.error = nil
        URLProtocolMock.response = nil
        cancellable = nil
    }
    
    func testNetworkService_WhenGetRequestSuccessFull_ThenResponseSuccess() throws {
        // Given
        let expectationReceive = expectation(description: "receiveValue")
        let expectationFailure = expectation(description: "failure")
        expectationFailure.isInverted = true
        let expectationFinished = expectation(description: "finished")
        
        let endPoint = NetworkRequest<APIResponse<[APIProductObject]>>(
            method: .GET,
            relativePath: DataConstants.MercadoPruebaService.searchProduct + "xbox",
            parameters: nil)
        
        let mockData = try JSONEncoder().encode(DataTestConstants.apiProductsObjectResponse)
        
        let userUrl = URL(string: NetworkServiceTest.baseUrl + DataConstants.MercadoPruebaService.searchProduct + "xbox")
        URLProtocolMock.testUrl = [userUrl: mockData]
        URLProtocolMock.response = HTTPURLResponse(
            url: userUrl!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        cancellable = sut.request(endPoint, queue: .main)
            .first()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    expectationFailure.fulfill()
                case .finished:
                    expectationFinished.fulfill()
                }
            } receiveValue: { response in
                XCTAssertNotNil(response)
                expectationReceive.fulfill()
            }
        
        // Then
        wait(for: [expectationFinished, expectationReceive, expectationFailure], timeout: 1)
        cancellable?.cancel()
    }
    
    
}
