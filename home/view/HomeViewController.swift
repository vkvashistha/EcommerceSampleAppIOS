//
//  ViewController.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 18/06/22.
//

import UIKit
import SDWebImage


class HomeViewController: BaseViewController {
    @IBOutlet weak var productCategoriesTableView: UITableView!
    var productCategories : [ProductCategory] = []
    let homeScreenViewModel = HomeScreenViewModel()
    var categoryIdSelected : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        productCategories = homeScreenViewModel.getProductCategories()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "ProductCategoryTableViewCell", bundle: nil)
        productCategoriesTableView.register(nib, forCellReuseIdentifier: "ProductCategoryTableViewCell")
        productCategoriesTableView.delegate = self
        productCategoriesTableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goto_collection") {
            let destinationVC = segue.destination as! CollectionViewController
            destinationVC.collectionId = categoryIdSelected
        }
        
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryIdSelected = productCategories[indexPath.row].id
        performSegue(withIdentifier: "goto_collection", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCategoryTableViewCell", for: indexPath) as! ProductCategoryTableViewCell
        //        cell.textLabel?.text = "Hello"
        
        //        cell.categoryImage?.image = UIImage(named: "plant")
        cell.imageView?.sd_setImage(with: URL(string: productCategories[indexPath.row].url), placeholderImage: UIImage(named: "Image"))
        
        return cell
        
    }
}

extension HomeViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizer : \(otherGestureRecognizer)")
        return true
    }
}
