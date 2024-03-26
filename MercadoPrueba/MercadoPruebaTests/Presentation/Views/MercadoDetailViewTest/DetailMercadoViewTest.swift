//
//  DetailMercadoViewTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
@testable import MercadoPrueba
import SnapshotTesting
import SwiftUI
import XCTest

class DetailBenefitViewTest: XCTestCase {
    private var viewController: UIViewController!
    private var sut: DetailMercadoView<DetailMercadoViewModel>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let dependencies = DetailMercadoViewModel.InputDependencies(detailMercadoData: .init(product: DataTestConstants.productObject))
        sut = DetailMercadoView(viewModel: DetailMercadoViewModel(dependencies: dependencies))
        viewController = UIHostingController(rootView: sut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
        sut = nil
    }
    
    func testDetailBenefitView_ThenOnViewIphoneSe() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }

    func testDetailBenefitView_ThenOnViewIphoneXsMax() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneXsMax))
    }
    

}
