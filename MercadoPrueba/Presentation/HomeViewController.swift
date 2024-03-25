//
//  ViewController.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import UIKit
import Combine
import Resolver
import Foundation
import SwiftUI

class HomeViewController: UIViewController {
    var mercadoPruebaRepository: MercadoPruebaRepositoryType?
    let swiftUIController = UIHostingController(rootView: MercadoView<MercadoViewModel>())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
            let vc = swiftUIController
            vc.modalPresentationStyle = .fullScreen
            if #available(iOS 13.0, *) {
                vc.overrideUserInterfaceStyle = .light
            }
            present(swiftUIController, animated: true, completion: nil)

        }
    }


}


extension HomeViewController {
    
    
}

