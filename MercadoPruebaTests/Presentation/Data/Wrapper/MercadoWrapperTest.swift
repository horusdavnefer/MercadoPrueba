//
//  MercadoWrapper.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
@testable import MercadoPrueba
import XCTest

class MercadoWrapperTest: XCTestCase {
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    func testMercadoWrapper_whenInputData_thenReturnObjectOutput() throws {
        // Given
        let input = DataTestConstants.apiProductsObjectResponse
        // When
        let result = MercadoWrapper.map(input: input)
        // Then
        XCTAssertEqual(result.count, input.count)
    }
}
 
