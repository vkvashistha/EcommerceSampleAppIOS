//
//  ProductCategoryTableViewCell.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import UIKit

class ProductCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
