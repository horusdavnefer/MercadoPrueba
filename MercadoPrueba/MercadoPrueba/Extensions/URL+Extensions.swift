//
//  URL+Extensions.swift
//  MercadoPrueba
//
//  Created by iMac on 23/03/24.
//

import Foundation
extension URL {
    static func getUrl(from string: String?) -> URL? {
        return URL(string: string ?? "")
    }
}
