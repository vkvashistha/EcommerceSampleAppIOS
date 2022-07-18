//
//  CollectionViewController.swift
//  EcommerceSampleAppIOS
//
//  Created by Vivek Vashistha on 28/06/22.
//

import UIKit

class CollectionViewController: BaseViewController {

    let viewModel = CollectionViewModel()
    public var collectionId : String?
    var collection : [Collection] = []
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(
      top: 50.0,
      left: 20.0,
      bottom: 50.0,
      right: 20.0)
    
    private var selectedItem : Collection?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(collectionId != nil) {
        collection = viewModel.getCollections(collectionId!)
        }
        let nib = UINib(nibName: "CollectionItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionItemCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "goto_product") {
            let destinationVC = segue.destination as! ProductViewController
            destinationVC.collection = selectedItem
        }
    }
    

}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = collection[indexPath.row]
        performSegue(withIdentifier: "goto_product", sender: self)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        // 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
      }
    
    // 3
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return sectionInsets
      }
      
      // 4
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return sectionInsets.left
      }
}

extension CollectionViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionItemCollectionViewCell", for: indexPath) as! CollectionItemCollectionViewCell
        cell.productTitle.text = collection[indexPath.row].title
        cell.productPrice.text = collection[indexPath.row].price
//        cell.itemImage.image = UIImage(named: "plant")
        cell.productImage?.sd_setImage(with: URL(string: collection[indexPath.row].url), placeholderImage: UIImage(named: "Image"))
        return cell
    }
    
    
}
