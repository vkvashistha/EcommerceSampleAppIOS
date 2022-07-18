//
//  ProductResponse.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct Sku : Decodable {
    let id:String
    let name:String
    let isAvailable:Bool
}

struct ProductInfo : Decodable{
    let id:String
    let imageUrls:[String]
    let title : String
    let description: String
    let price : String
    let variants:[Sku]
    let maxQty : Int
    let rating:Float
}

struct ProductResponse : Decodable {
    let status: Status
    let result : ProductInfo?
}
