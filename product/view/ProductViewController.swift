//
//  ProductViewController.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 28/06/22.
//

import UIKit

class ProductViewController: BaseViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    public var collection : Collection?
    private let productViewModel = ProductViewModel()
    private var productInfo : ProductInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let collection  = self.collection {
            if let productInfo = productViewModel.getProductInfo(productId: collection.id) {
                productImage.sd_setImage(with: URL(string: productInfo.imageUrls[0]), placeholderImage: UIImage(named: "Image"))
                productTitle.text = productInfo.title
                productRating.text = "Rate \(productInfo.rating) stars"
                productDescription.text = productInfo.description
                self.productInfo = productInfo
            }
            
        }
    }
    
    
    @IBAction func onAddToCart(_ sender: Any) {
        if(productInfo != nil) {
            User.addCartItem(CartItem(productInfo!.id, productInfo!.title, productInfo!.imageUrls[0], productInfo!.price, 1, productInfo!.maxQty))
            addToCartButton.setTitle("Added", for: .normal)
        }
    }
    

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProductViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
