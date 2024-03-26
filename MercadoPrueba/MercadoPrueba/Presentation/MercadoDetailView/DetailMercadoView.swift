//
//  DetailMercadoView.swift
//  MercadoPrueba
//
//  Created by iMac on 24/03/24.
//
import Resolver
import SkeletonUI
import SwiftUI
import UIKit

struct DetailMercadoView<ViewModelType>: View where ViewModelType: DetailMercadoViewModel {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    //@Environment(\.openURL) private var openURL

    @ViewBuilder
    var infoView: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(url: URL.getUrl(from: viewModel.state.product?.thumbnail!.replacingOccurrences(of: "http", with: "https").replacingOccurrences(of: "https2", with: "http2"))) { image in
                    image
                        .centerCropped()
                        .cornerRadius(4)
                } placeholder: {
                    AnyView(ActivityIndicator())
                }
                .skeleton(with:  viewModel.state.isLoading,
                          animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
               
                .frame(maxWidth: .infinity, minHeight: DetailMercadoState.Constants.heightImageVertically)
                
            }
            
            .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity)
            
            Text(viewModel.state.product?.title)
                .font(.custom(ConstantsUi.Font.bold, size: 24))
                .foregroundStyle(.black)
                .skeleton(with:  viewModel.state.isLoading,
                          animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
            Text("Condicion: "+(viewModel.state.product?.condition ?? "").replacingOccurrences(of: "used", with: "Usado").replacingOccurrences(of: "new", with: "Nuevo"))
                .font(.custom(ConstantsUi.Font.regular, size: 16))
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .skeleton(with:  viewModel.state.isLoading,
                          animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
            
        }
        Spacer()
    }

    var priceView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(String.formatAmount(viewModel.state.product?.price ?? 0))
                .font(.custom(ConstantsUi.Font.boldItalic, size: 30))
                .foregroundStyle(.black)
                .skeleton(with:  viewModel.state.isLoading,
                          animation: .pulse(duration: 0.2, delay: 0.1, speed: 1, autoreverses: true), shape: .capsule)
            Spacer()
            Spacer()
            Spacer()
            Link("Ir al Sitio del producto", destination: URL(string: viewModel.state.product?.permalink ?? "")!)
                .font(.custom(ConstantsUi.Font.boldItalic, size: 30))
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            
        }
        .padding(.vertical, 5)
    }
    
    
    
    var body: some View {
        
            ScrollView {
                VStack(alignment: .center) {
                    infoView
                    priceView
                }.padding()
                    .onAppear {
                        viewModel.onAppear()
                    }
                    .onDisappear {
                        viewModel.onDisAppear()
                    }
                
            }
            .background(ConstantsUi.Colors.colorWhiteBackground.edgesIgnoringSafeArea(.all))
            .navigationBarTitle(DetailMercadoState.Constants.title)
        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            self.navigationItem.title = DetailBenefitState.Constants.title
//            self.navigationController?.configureOnepayAppearance()
//            self.navigationController?.navigationBar.topItem?.backButtonTitle = .empty
//        }
   
    }
}

