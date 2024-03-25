//
//  PruebaErrorView.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import Foundation
import SwiftUI

struct PruebaErrorView: View {
    var pruebaErrorType: PruebaErrorType?
    let pruebaErrorProtocol: PruebaErrorProtocol?
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                pruebaErrorType?.errorImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(71)
            }
            Text(pruebaErrorType?.errorTitle)
                .font(.custom(ConstantsUi.Font.medium, size: 20))
                .foregroundColor(ConstantsUi.Colors.colorGrayDark)
                .multilineTextAlignment(.center)
            Text(pruebaErrorType?.errorDescription)
                .font(.custom(ConstantsUi.Font.regular, size: 16))
                .foregroundColor(ConstantsUi.Colors.colorGrayLight)
                .multilineTextAlignment(.center)

            Button(action: {
                switch pruebaErrorType?.typeReturn {
                case .tryAgain:
                    pruebaErrorProtocol?.tryAgain()
                case .close:
                    pruebaErrorProtocol?.closeAction()
                case .none:
                    break
                }
            }) {
                Text(pruebaErrorType?.buttonTitle)
                    .font(.custom(ConstantsUi.Font.medium, size: 14))
                    .foregroundColor(ConstantsUi.Colors.colorWhite)
                    .multilineTextAlignment(.center)
                    .padding(12)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .background(ConstantsUi.Colors.colorCianLight)
            .cornerRadius(4.0)
            .padding([.leading, .trailing], 0)
            Spacer()
        }
        .padding(42)
    }
}
