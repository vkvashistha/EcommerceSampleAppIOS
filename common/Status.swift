//
//  Status.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

struct Status : Decodable {
    let code:Int
    let message:String
    init(_ code:Int, _ message:String) {
        self.code = code
        self.message = message
    }
}
