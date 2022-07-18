//
//  User.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import Foundation

class User {
    private static var cartItems : [CartItem] = []
    private static var cartItemsLiveData : LiveData<[CartItem]> = LiveData([])

    static func addCartItem(_ item : CartItem) {
        cartItems.append(item)
        cartItemsLiveData.value = cartItems
    }

    static func removeCartItem(_ item : CartItem) {
        cartItems =  cartItems.filter({ cartItem in
            item.id == cartItem.id
        })
        cartItemsLiveData.value = cartItems
    }

    static func getCartItemsObserver() -> LiveData<[CartItem]> {
        return cartItemsLiveData
    }

    static func getCartItems() -> [CartItem] {
        return cartItems
    }

    static func clearCart() {
        cartItems.removeAll()
        cartItemsLiveData.value = cartItems
    }
}
