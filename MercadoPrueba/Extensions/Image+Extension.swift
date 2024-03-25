//
//  Image+Extension.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import Foundation
import SwiftUI

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .scaledToFit()
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
