//
//  ActivityIndicator.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool

    let style: UIActivityIndicatorView.Style
    
    init(isAnimating: Binding<Bool> = .constant(true), style: UIActivityIndicatorView.Style = .medium) {
        _isAnimating = isAnimating
        self.style = style
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
