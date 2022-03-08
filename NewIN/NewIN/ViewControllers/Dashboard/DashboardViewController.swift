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
    @IBOutlet weak var collectionview_items: UICollectionView!
    var itemData = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getReview()
        registerCollectionView()
        setRightBarButton()
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
    
    @objc func btnWishListClicked(_ sender: Any) {
        if let wishlistViewController = Router.getControllerWith(identifier: Views.wishlist.rawValue) as? WishListViewController {
            wishlistViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(wishlistViewController, animated: true, completion: nil)
        }
    }
    
    func setRightBarButton(){
        let wishListBtn = UIButton(type: .custom)
        wishListBtn.setImage(UIImage(named: "wishlist"), for: .normal)
        wishListBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        wishListBtn.addTarget(self, action: #selector(DashboardViewController.btnWishListClicked(_:)), for: .touchUpInside)
        let rightBtn = UIBarButtonItem(customView: wishListBtn)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func navigateItemView(item:[Item], indexPath:Int){
        if let itemViewController = Router.getControllerWith(identifier: Views.itemView.rawValue) as? ItemViewController {
            itemViewController.modalPresentationStyle = .fullScreen
            itemViewController.itemData = item
            itemViewController.indexPath = indexPath
            self.navigationController?.present(itemViewController, animated: true, completion: nil)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateItemView(item:itemData, indexPath:indexPath.row)
    }
}

