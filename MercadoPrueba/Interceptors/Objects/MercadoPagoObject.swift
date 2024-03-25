//
//  MercadoPagoResponse.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation

struct MercadoPagoObject: Identifiable {
    var id: Int?
    var site_id: String?
    var country_default_time_zone: String?
    var results: MercadoProductObjects?
    
    init(
        id:Int?,
        site_id: String?,
        country_default_time_zone: String?,
        results: MercadoProductObjects?){
            self.id = id
            self.site_id = site_id!
            self.country_default_time_zone = country_default_time_zone!
            self.results = results!
        }
}
