//
//  WishListViewController.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class WishListViewController: UIViewController {

    @IBOutlet weak var tbl_wishList: UITableView!
    @IBOutlet weak var tlbl_title: UILabel!
    var wishListItem = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tlbl_title.text = "WISHLIST (" + String(Global.sharedInstance.itemValues.count) + ")"
        // Do any additional setup after loading the view.
        registerTableViewCell()
        wishListItem = Global.sharedInstance.itemValues
    }
    
    func registerTableViewCell() {
        tbl_wishList.register(WishListTableViewCell.nib(), forCellReuseIdentifier: Constants.wishListTableViewCell)
        tbl_wishList.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension WishListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.sharedInstance.itemValues.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.wishListTableViewCell) as! WishListTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        cell.configureCell(item: wishListItem, indexPath: indexPath.row)
        cell.reloadListDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 189.0
    }
    
}

extension WishListViewController : reloadListDelegate{
    func reloadList() {
        wishListItem = Global.sharedInstance.itemValues
        self.tlbl_title.text = "WISHLIST (" + String(Global.sharedInstance.itemValues.count) + ")"
        tbl_wishList.reloadData()
    }
}
