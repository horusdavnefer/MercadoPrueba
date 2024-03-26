//
//  ProductCellView.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import SkeletonUI
import SwiftUI

struct ProductCellView: View {
    var product: ProductObject?
    var loading: Bool
    
    //    private func setupNavigationBar() {
    //        self.navigationItem.title = DetailBenefitState.Constants.title
    //        self.navigationController?.configureOnepayAppearance()
    //        self.navigationController?.navigationBar.shadowImage = nil
    //        self.navigationController?.navigationBar.isTranslucent = false
    //        self.navigationController?.navigationBar.backgroundColor = nil
    //    }
    
    private enum Constants {
        static let heightImageHorizontally: CGFloat = 250
        static let heightTextHorizontally: CGFloat = 20
        static let grayLightColor: Color = ConstantsUi.Colors.colorGrayLight
        static let grayDarkColor: Color = ConstantsUi.Colors.colorGrayDark
        static let grayShadowColor: Color = ConstantsUi.Colors.colorShadowLight
    }
    
    init(product: ProductObject?,
         loading: Bool) {
        self.product = product
        self.loading = loading
    }
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    HStack {
                        AsyncImage(url: URL.getUrl(from: product?.thumbnail!.replacingOccurrences(of: "http", with: "https").replacingOccurrences(of: "https2", with: "http2"))) { image in
                            image
                                .centerCropped()
                        } placeholder: {
                            AnyView(ActivityIndicator())
                        }
                        .skeleton(with: loading,
                                  animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
                        
                        .background(ConstantsUi.Colors.colorGrayDark)
                    }
                    .frame(width: geo.size.width  ,height: geo.size.width , alignment: .top)
                    .cornerRadius(10.0,corners: [.topLeft,.topRight])
                    .scaledToFill()
                    
                }
                    
                Text(product?.title.uppercased())
                    .font(.custom(ConstantsUi.Font.bold, size: 16))
                    .foregroundColor(Constants.grayDarkColor)
                    .frame(height: Constants.heightTextHorizontally, alignment: .topLeading)
                    .skeleton(with: loading,
                              animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    
                Text("Condicion: "+(product?.condition ?? "").replacingOccurrences(of: "used", with: "Usado").replacingOccurrences(of: "new", with: "Nuevo"))
                    .font(.custom(ConstantsUi.Font.bold, size: 12))
                    .foregroundColor(Constants.grayLightColor)
                    .skeleton(with: loading)
                    .skeleton(with: loading,
                              animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
                    .multilineTextAlignment(.leading)
                    
                Text(String.formatAmount(product?.price ?? 0))
                    .font(.custom(ConstantsUi.Font.regular, size: 16))
                    .foregroundColor(Constants.grayDarkColor)
                    .fixedSize(horizontal: false, vertical: true)
                    .skeleton(with: loading,
                              animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
                    .padding(.bottom, 8.0)
                    .frame(height: Constants.heightTextHorizontally, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                
            }.frame(height: 220.0, alignment: .topLeading)
                .padding(.all,8)
                .cornerRadius(10.0,corners: [.topLeft,.topRight])
                .background(ConstantsUi.Colors.colorCianDark.edgesIgnoringSafeArea(.all))
        }
        .frame(width: 165.0)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
        .cornerRadius(10.0)
        .shadow(color:Constants.grayShadowColor, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
    

