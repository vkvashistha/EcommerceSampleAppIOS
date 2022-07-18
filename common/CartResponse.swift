//
//  CartResponse.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct CartItem {
    let id:String
    let productId:String
    let title: String
    let url:String
    let price:String
    let qty : Int
    let maxQty : Int
    init(_ productId:String, _ title:String, _ url:String, _ price:String, _ qty:Int, _ maxQty:Int) {
        self.productId = productId
        self.title = title
        self.url = url
        self.price = price
        self.qty = qty
        self.maxQty = maxQty
        self.id = UUID.init().uuidString
    }
}

struct CartItems {
    let items:[CartItem]
    let totalAmount : String
    init(_ items:[CartItem], _ totalAmount:String) {
        self.items = items
        self.totalAmount = totalAmount
    }
}

struct CartResponse {
    let status:Status
    let result : CartItems
    init(_ status:Status, _ result:CartItems) {
        self.status = status
        self.result = result
    }
}
