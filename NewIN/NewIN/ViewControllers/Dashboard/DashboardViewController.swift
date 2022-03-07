//
//  ViewController.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var dashboardVM = DashboardviewModel()
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var btn_wishlist: UIButton!
    @IBOutlet weak var collectionview_items: UICollectionView!
    var itemData = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getReview()
        registerCollectionView()
    }
    
    // MARK: - User defined methods
    func getReview() {
        dashboardVM.apiAllItems() { items, Error in
            if let allIteams = items {
                print(allIteams)
                self.titleLbl.text = allIteams.title
                self.itemData = allIteams.items
                self.collectionview_items.reloadData()
            }
        }
    }
    
    func registerCollectionView(){
        collectionview_items.register(UINib.init(nibName: Constants.itemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.itelCollectionCellID)
    }
    
}

extension DashboardViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.itelCollectionCellID, for: indexPath as IndexPath) as! ItemCollectionViewCell
        cell.configureCell(item: itemData, indexPath: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240.0, height: 290.0)
    }

}

