//
//  Repository.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

class Repository {
    func getProductCategories() -> ProductCategoryResponse {
        do {
            return try JSONDecoder().decode(ProductCategoryResponse.self, from: productCategories.toJSON())
        } catch {
            return ProductCategoryResponse(status: Status(1,"failed"), result: nil)
        }
    }
    
    func getCollections(collectionId:String) -> CollectionResponse {
        do {
            return try JSONDecoder().decode(CollectionResponse.self, from: productCollection.toJSON())
        } catch {
            return CollectionResponse(status: Status(1,"failed"), result: nil)
        }
        
    }
    
    func getProductInfo(productId:String) -> ProductResponse {
        do {
            return try JSONDecoder().decode(ProductResponse.self, from: productResponse.toJSON())
        } catch {
            return ProductResponse(status: Status(1,"failed"), result: nil)
        }
    }
    
    func getUserCart() -> CartResponse {
        return CartResponse(Status(0,"success"), CartItems(User.getCartItems(), String(getTotal(User.getCartItems()))))
    }
    
    func removeCartItem(_ item:CartItem) -> CartResponse {
        User.removeCartItem(item)
        return CartResponse(Status(0,"success"), CartItems(User.getCartItems(), "₹ " + String(getTotal(User.getCartItems()))))
    }
    
    private func getTotal(_ items : [CartItem]) -> Float {
        var total : Float = 0.0
        
        for item in items {
            total = total + item.price.replacingOccurrences(of: "₹", with: "").trimmingCharacters(in: .whitespaces).floatValue
        }
        return total
    }
}

extension String {
    func toJSON() -> Data {
//        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
//        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        return Data(self.utf8)
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
