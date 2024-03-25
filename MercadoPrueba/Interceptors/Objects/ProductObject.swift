//
//  ProductObject.swift
//  MercadoPrueba
//
//  Created by david duran on 21/03/24.
//

import Foundation
struct ProductObject: Identifiable {
    var id: String
    var title: String
    var condition: String
    var thumbnail_id: String
    //var catalog_product_id: String
    var listing_type_id: String
    var permalink: String
    var buying_mode: String
    var site_id: String
    var category_id: String
    var domain_id: String
    var thumbnail: String?
    var currency_id: String
    var order_backend: Int
    var price: Double
    //var original_price: Double
    //var sale_price: String
    var available_quantity: Int
    //var official_store_id: String
    var use_thumbnail_id: Bool
    var accepts_mercadopago: Bool
    init(
        id: String,
        title: String,
        condition: String,
        thumbnail_id: String,
        //catalog_product_id: String,
        listing_type_id: String,
        permalink: String,
        buying_mode: String,
        site_id: String,
        category_id: String,
        domain_id: String,
        thumbnail: String?,
        currency_id: String,
        order_backend: Int,
        price: Double,
        //original_price: Double,
       // sale_price: String,
        available_quantity: Int,
        //official_store_id: String,
        use_thumbnail_id: Bool,
        accepts_mercadopago: Bool){
            self.id = id
            self.title = title
            self.condition = condition
            self.thumbnail_id = thumbnail_id
            //self.catalog_product_id = catalog_product_id
            self.listing_type_id = listing_type_id
            self.permalink = permalink
            self.buying_mode = buying_mode
            self.site_id = site_id
            self.category_id = category_id
            self.domain_id = domain_id
            self.thumbnail = thumbnail
            self.currency_id = currency_id
            self.order_backend = order_backend
            self.price = price
            //self.original_price = original_price
            //self.sale_price = sale_price
            self.available_quantity = available_quantity
           // self.official_store_id = official_store_id
            self.use_thumbnail_id = use_thumbnail_id
            self.accepts_mercadopago = accepts_mercadopago
        }
}
