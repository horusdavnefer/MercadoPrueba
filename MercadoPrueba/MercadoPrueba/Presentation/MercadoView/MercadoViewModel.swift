//
//  MercadoViewModel.swift
//  MercadoPrueba
//
//  Created by david duran on 22/03/24.
//

import Combine
import Resolver
import Foundation
import SystemConfiguration

final class MercadoViewModel: BaseViewModel {
    
    
    @Injected var getMercadoProductInteractor: AnyInteractor<String?, [ProductObject]>
    
    struct InputDependencies {
        let ownView: MercadoViewType
    }
    
    private var mercadoPagoObject: MercadoPagoObject?
    private var productsObjects: [ProductObject] = []
    
    private let dependencies: InputDependencies
    @Published var state = MercadoPruebaState()
    
    private var subscribers: Set<AnyCancellable> = []
    
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
        super.init()
        errorHandler = self
        getProductsbyString("merca")
    }
    
    func getProductsbyString(_ query: String) {
        getMercadoProductInteractor.execute(params: query)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                debugPrint("getProductsbyString error", error)
                self?.state.isLoading = false
                self?.state.pruebaErrorType = .error400
                self?.showConnectivityError()
            } receiveValue: { [weak self] benefits in
                self?.bindBenefits(with: benefits)
                debugPrint("getProductsbyString success", benefits)
            }
            .store(in: &subscribers)
    }
    
    func bindBenefits(with mercadoPagoObject: [ProductObject]) {
        productsObjects = mercadoPagoObject
        state.mercadoPruebaObjects = mercadoPagoObject 
        state.isLoading = false
        if productsObjects.isEmpty {
            state.pruebaErrorType = .emptyView
            state.numberSkeletonCellBenefit = 0
            showConnectivityError()
            return
        }
        objectWillChange.send()
    }
    
    override func showConnectivityError() {
        state.showError = true
        objectWillChange.send()
    }
    
    override func hideConnectivityError() {
        state.showError = false
        objectWillChange.send()
    }
    
    func isConnectedToNetwork() -> Bool {

        /*var status:Bool = false

        let url = NSURL(string: "https://google.com")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "HEAD"
        request.timeoutInterval = 5.0

        var response:URLResponse?

        do {
            let _ = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) as NSData?
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }

        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                status = true
            }
        }*/
        return true
    }
    
}

extension MercadoViewModel: MercadoViewModelType {
    func showProductDetailView(product: ProductObject?) {
        if isConnectedToNetwork() {
            Resolver.registerPresentationDetailProductViewDependencies(product: .init(product: product))
            dependencies.ownView.showMercadoDetailView()
        } else {
            state.pruebaErrorType = .noInternetConnection
            showConnectivityError()
        }
    }
    
    
    func onAppear() {
        if isConnectedToNetwork() {
            
        } else {
            state.pruebaErrorType = .noInternetConnection
            showConnectivityError()
        }
    }
    
    func onDisAppear() {
        loading = false
    }
    
    
    
    
    func inComplete() {
        if isConnectedToNetwork() {
            
        } else {
            state.pruebaErrorType = .noInternetConnection
            showConnectivityError()
        }
    }
    
    func noComplete() {
        loading = false
    }
}

extension MercadoViewModel: PruebaErrorProtocol {
    func closeAction() {
        
        hideConnectivityError()
    }
    
    func tryAgain() {
        hideConnectivityError()
        onAppear()
    }
    
    func logOut() {
        
    }
    
}
