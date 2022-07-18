//
//  ProductCategoryResponse.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct ProductCategoryResponse : Decodable{
    let status:Status
    let result:[[ProductCategory]]?
    init (status:Status, result:[[ProductCategory]]?) {
        self.status = status
        self.result = result
    }
    
}
