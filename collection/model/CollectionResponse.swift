//
//  CollectionResponse.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct CollectionResponse : Decodable{
    let status : Status
    let result : [Collection]?
    init(status:Status, result:[Collection]?) {
        self.result = result
        self.status = status
    }
}

struct Collection : Decodable {
    let id:String
    let url:String
    let title:String
    let price:String
    init(id:String, url:String, title:String, price:String) {
        self.id = id
        self.url = url
        self.title = title
        self.price = price
    }
}
