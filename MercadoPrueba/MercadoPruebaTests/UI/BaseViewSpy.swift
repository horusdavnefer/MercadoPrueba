//
//  BaseViewSpy.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
@testable import MercadoPrueba

class BaseViewSpy: BaseView {
    var showErrorCallback: (() -> Void)?
    var showConnectivityErrorCallback: (() -> Void)?
    var hideConnectivityErrorCallback: (() -> Void)?
    
    func showError(error: Error) {
        showErrorCallback?()
    }
    
    func showConnectivityError() {
        showConnectivityErrorCallback?()
    }
    
    func hideConnectivityError() {
        hideConnectivityErrorCallback?()
    }
}
