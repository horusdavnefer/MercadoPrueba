//
//  MercadoViewTest.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
import Resolver
import SnapshotTesting
import SwiftUI
import XCTest
@testable import MercadoPrueba

class MercadoViewTest: XCTestCase {
    private var viewController: UIViewController!
    private var sut: MercadoView<MercadoViewModel>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        Resolver.registerPresentationMock()
        let dependencies = MercadoViewModel.InputDependencies(
            ownView: Resolver.resolve(MylearningOwnViewSpy.self)
        )
        sut = MercadoView(viewModel: MercadoViewModel(dependencies: dependencies))
        viewController = UIHostingController(rootView: sut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
        sut = nil
    }
    
    func testBenefitsView_ThenOnViewIphoneSe() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }

    func testBenefitsView_ThenOnViewIphoneXsMax() throws {
        // Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneXsMax))
    }
}
