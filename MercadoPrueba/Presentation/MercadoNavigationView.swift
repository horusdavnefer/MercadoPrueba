//
//  MercadoNavigationView.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//
import Foundation
import SwiftUI
import UIKit
class MercadoNavigationView: MercadoViewType {
    func showMercadoDetailView() {
        let hostingController = UIHostingController(rootView: DetailMercadoView<DetailMercadoViewModel>())
        let vc = hostingController
        vc.modalPresentationStyle = .fullScreen
        if #available(iOS 13.0, *) {
            vc.overrideUserInterfaceStyle = .light
        }
        //present(vc, animated: true, completion: nil)
        UIApplication.topViewController()?.navigationController?.present(hostingController, animated: true)
    }
     
}
