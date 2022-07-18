//
//  ProductViewModel.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 28/06/22.
//

import Foundation

class ProductViewModel {
    private let repository = Repository()
    public func getProductInfo(productId : String) -> ProductInfo? {
        return repository.getProductInfo(productId: productId).result
    }
}
