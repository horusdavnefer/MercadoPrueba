//
//  MylearningOwnViewSpy.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
@testable import MercadoPrueba

final class MylearningOwnViewSpy: BaseViewSpy {
    var showMercadoDetailViewCallback: (() -> Void)?
}

extension MylearningOwnViewSpy: MercadoViewType {
    func showMercadoDetailView() {
        showMercadoDetailViewCallback?()
    }
}
