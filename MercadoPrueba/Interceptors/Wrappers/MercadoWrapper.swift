//
//  MercadoWrapper.swift
//  MercadoPrueba
//
//  Created by iMac on 22/03/24.
//

import Foundation

public struct MercadoWrapper: WrapperType {
    typealias Input = APIMercadoPagoObjectResponse
    typealias Output = MercadoPagoObject

    static func map(input: APIMercadoPagoObjectResponse) -> MercadoPagoObject {
        
        return MercadoPagoObject(id: input.id, site_id: input.site_id, country_default_time_zone: input.country_default_time_zone, results: getMercadoPagoObject(input: input.results!))
    }
    
    static func getMercadoPagoObject(input: APIMercadoProductObjectsResponse) -> MercadoProductObjects {
        
        let productsObjects = input.mercadoProductObject
        
        return MercadoProductObjects(mercadoProductObject: getProducts(input: productsObjects))
    }
    
    static func getProducts(input: [APIProductObject]?) -> [ProductObject]? {
        let product = input?.map {
            getProducts(input: $0)
        }
        return product
    }
    
    static func getProducts(input: APIProductObject) -> ProductObject {
        return ProductObject(id: input.id,
                             title: input.title,
                             condition: input.condition,
                             thumbnail_id: input.thumbnail_id,
                             catalog_product_id: input.catalog_product_id,
                             listing_type_id: input.listing_type_id,
                             permalink: input.permalink,
                             buying_mode: input.buying_mode,
                             site_id: input.site_id,
                             category_id: input.category_id,
                             domain_id: input.domain_id,
                             thumbnail: input.thumbnail,
                             currency_id: input.currency_id,
                             order_backend: input.order_backend,
                             price: input.price,
                             original_price: input.original_price,
                             sale_price: input.sale_price,
                             available_quantity: input.available_quantity,
                             official_store_id: input.official_store_id,
                             use_thumbnail_id: input.use_thumbnail_id,
                             accepts_mercadopago: input.accepts_mercadopago)
    }
}
