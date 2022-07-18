//
//  CollectionViewModel.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 28/06/22.
//

import Foundation

public class CollectionViewModel {
    private let repository = Repository()
    func getCollections(_ collectionId:String) -> [Collection] {
        if let result = repository.getCollections(collectionId: collectionId).result {
            return result
        } else {
            return []
        }
    }
}
