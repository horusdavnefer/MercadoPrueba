//
//  MercadoView.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import Resolver
import SkeletonUI
import SwiftUI

struct MercadoView<ViewModelType>: View where ViewModelType: MercadoViewModelType & PruebaErrorProtocol {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    @ViewBuilder
    var searchview: some View {
        VStack(alignment: .leading) {
            NavigationStack { 
                ConstantsUi.Colors.colorCianLight.edgesIgnoringSafeArea(.all)
            }
            .searchable(text: $viewModel.state.searchText)
            .onChange(of: viewModel.state.searchText) { value in
                if value.isEmpty {
                    viewModel.getProductsbyString("merca")
                }
            }
            .onSubmit(of: .search) {
                viewModel.getProductsbyString(viewModel.state.searchText)
            }
            .scrollContentBackground(.hidden)
            
        }
        .frame(width: 380, height: 100,alignment: .topLeading)
        
    }
    
    
    @State private var showingSheet = false
    
    @ViewBuilder
    var ProductsView: some View {
        VStack {
            SkeletonForEachWithIndex(with: viewModel.state.mercadoPruebaObjects, quantity: viewModel.state.numberSkeletonCellBenefit, cellType: viewModel.state.cellType) { _, loading, product, cellType in
                Button {
                    showingSheet.toggle()
                    Resolver.registerPresentationDetailProductViewDependencies(product: .init(product: product))
                    //viewModel.showProductDetailView(product: product)
                } label: {
                    ProductCellView(
                        product: product, loading: loading)
                    
                }.frame(alignment: .trailing)
                .sheet(isPresented: $showingSheet) {
                    DetailMercadoView<DetailMercadoViewModel>()
                }
                
            }
        }
        .background(ConstantsUi.Colors.colorCianLight.edgesIgnoringSafeArea(.all))
    }
    
    var body: some View {
        
            ScrollView {
                
                VStack {
                    searchview
                    ProductsView
                }
                .padding(.horizontal, 20)

            }
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisAppear()
            }
            .background(ConstantsUi.Colors.colorCianLight.edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $viewModel.state.showError) {
                PruebaErrorView(pruebaErrorType: viewModel.state.pruebaErrorType, pruebaErrorProtocol: viewModel)
            }
            .navigationBarTitle(Text("MercadoPrueba"))
            .frame(alignment: .topLeading)
            
        }
    }
    
