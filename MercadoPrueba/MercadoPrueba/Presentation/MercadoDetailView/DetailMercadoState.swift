//
//  DetailMercadoState.swift
//  MercadoPrueba
//
//  Created by iMac on 24/03/24.
//

import SwiftUI

final class DetailMercadoState: ObservableObject {
    @Published var product: ProductObject?
    @Published var isLoading: Bool = true
    @Published var isOpenTermsAndConditions: Bool = false
    @Published var isOpenBenefistType: Bool = true
    @Published var numberSkeletonCell: Int = 2
    @Published var numberStateInteraccion: Int = 1
    
    @Published var isComplete: Bool = false
    @Published var noComplete: Bool = false
    
    enum Constants {
        static let heightImageVertically: CGFloat = 230
        static let separatorString = "-"
        static let yourCodeString = "Este es tu código de descuento"
        static let digitalBenefistString = "Beneficio digital"
        static let fisicalBenefistString = "Beneficio presencial"
        static let digitalBenefistTextString = "Usa este código como cupón de dcto en el proceso de pago."
        static let fisicalBenefistTextString = "Deberás dictar este código al momento de la compra."
        static let termsAndConditionString = "Términos y condiciones"
        static let goToEcommerceString = "Ir al sitio del beneficio"
        static let title = "Detalle del producto"
        static let general = "General"
        static let condicionConvenio = "Condicion de convenio"
        static let desde = "Desde:"
        static let hasta = "Hasta:"
        static let buttonTittle = "Generar código"
        static let noCode = "Código no dispoble"
    }
}


