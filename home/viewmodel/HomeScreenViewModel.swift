//
//  HomeScreenViewModel.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

class HomeScreenViewModel {
    private let repository = Repository()
    
    func getProductCategories() -> [ProductCategory] {
        let productCategory = repository.getProductCategories()
        var categories : [ProductCategory] = []
        if let result = productCategory.result {
            for category in result {
                categories.append(category[0])
            }
        }
        
        return categories
        
    }
}
