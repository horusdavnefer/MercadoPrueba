//
//  ConstantsUi.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Foundation
import SwiftUI
struct ConstantsUi {
    struct Font {
        static let medium = "Roboto-Medium"
        static let light = "Roboto-Light"
        static let regular = "Roboto-Regular"
        static let mediumThinItalic = "Roboto-MediumItalic"
        static let thinItalic = "Roboto-ThinItalic"
        static let boldItalic = "Roboto-BoldItalic"
        static let lightItalic = "Roboto-LightItalic"
        static let italic = "Roboto-Italic"
        static let blackItalic = "Roboto-BlackItalic"
        static let bold = "Roboto-Bold"
        static let thin = "Roboto-Thin"
        static let black = "Roboto-Black"
    }
    
    struct Colors {
        static let colorCianDark: Color = .init(hex: "009BDD")
        static let colorCianLight: Color = .init(hex: "3FA7FF")
        static let colorGrayDark: Color = .init(hex: "2D3338")
        static let colorGrayLight: Color = .init(hex: "828EA5")
        static let colorGrayClean: Color = .init(hex: "#E7EBF3")
        static let colorGrayTerms: Color = .init(hex: "AGAFCA")
        static let colorGraySubTitle: Color = .init(hex: "707382")
        static let colorWhite: Color = .init(hex: "FFFFFF")
        static let colorWhiteBackground: Color = .init(hex: "F9FBFE")
        static let colorCyanBackgorund: Color = .init(hex: "EBF6FF")
        static let colorShadowLight: Color = .init(hex: "0E15200A")
        static let colorBlack: Color = .init(hex: "000000")

    }
    
    
    class ClassBundle {}
    static var bundle : Bundle { return Bundle(for: ConstantsUi.ClassBundle.self) }
    
    struct Images {
        
        static let iconDiscountEmpty: Image = Image("IconDiscountEmpty", bundle: bundle)
        static let IconError400: Image = Image("IconError400", bundle: bundle)
        static let iconError403: Image = Image("IconError403", bundle: bundle)
        static let iconError404: Image = Image("IconError404", bundle: bundle)
        static let iconErrorNoInternetConnection: Image = Image("IconErrorNoInternetConnection", bundle: bundle)
        
    }
}

