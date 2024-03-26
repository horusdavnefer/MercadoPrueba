//
//  DataConstants.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation

struct DataConstants {
    enum APIClient {
        static let contentType = "Content-Type"
    }
    
    enum InnerConstants {
        static let applicationJson = "application/json"
    }
    
    struct MercadoPruebaService {
        static let searchProduct = "/sites/MCO/search?q="

    }
    
    struct DateFormats {
        static let YYYYMMddHHMMSS = "yyyy-MM-dd HH:mm:ss"
        static let ddMMYYYY = "MM/dd/yyyy"
    }
}
