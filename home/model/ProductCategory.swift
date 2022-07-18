//
//  ProductCategory.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct ProductCategory : Decodable {
    let url:String
    let title:String
    let id:String
    
    init(url:String,  title:String, id:String) {
        self.url = url
        self.title = title
        self.id = id
    }
}
