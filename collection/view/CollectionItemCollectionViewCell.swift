//
//  CollectionItemCollectionViewCell.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 28/06/22.
//

import UIKit

class CollectionItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
