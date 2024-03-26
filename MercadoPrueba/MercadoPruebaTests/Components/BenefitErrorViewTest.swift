//
//  BenefitErrorView.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

@testable import MercadoPrueba
import SnapshotTesting 
import SwiftUI
import XCTest

class BenefitErrorViewTest: XCTestCase {
    private var viewController: UIViewController!
    private var sut: PruebaErrorView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = PruebaErrorView(pruebaErrorType: .error400, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError400_ThenOnViewIphoneSe() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError400_ThenOnViewIphoneXsMax() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneXsMax))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError404_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error404, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError404_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error404, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError504_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error504, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError504_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error504, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsEmptyView_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .emptyView, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsEmptyView_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .emptyView, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsNoInternetConnection_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .noInternetConnection, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsNoInternetConnection_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .noInternetConnection, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsTimeOut_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .timeOut, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsTimeOut_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .timeOut, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError403_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error403, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError403_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error403, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError405_ThenOnViewIphoneSe() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error405, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testBenefitErrorView_WhenTypeErrorIsError405_ThenOnViewIphoneXsMax() throws {
        // When
        sut = PruebaErrorView(pruebaErrorType: .error405, pruebaErrorProtocol: nil)
        viewController = UIHostingController(rootView: sut)
        
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
}

