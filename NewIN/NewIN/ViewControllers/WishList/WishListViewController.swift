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
  //  var wishVC = WishListViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarButton()
        self.tlbl_title.text = "wishlist"
        // Do any additional setup after loading the view.
        registerTableViewCell()
    }
    
    func registerTableViewCell() {
        tbl_wishList.register(WishListTableViewCell.nib(), forCellReuseIdentifier: Constants.wishListTableViewCell)
        tbl_wishList.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func closeBtnClicked(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
     
     func setNavigationBarButton(){
         let closeBtn = UIButton(type: .custom)
         closeBtn.setImage(UIImage(named: "close"), for: .normal)
         closeBtn.backgroundColor = .red
         closeBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
         closeBtn.addTarget(self, action: #selector(WishListViewController.closeBtnClicked(_:)), for: .touchUpInside)
         let rightBtn = UIBarButtonItem(customView: closeBtn)

         let backBtn = UIButton(type: .custom)
         backBtn.setImage(UIImage(named: "back"), for: .normal)
         backBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
         backBtn.addTarget(self, action: #selector(WishListViewController.backBtnClicked(_:)), for: .touchUpInside)
         let leftBtn = UIBarButtonItem(customView: backBtn)

         self.navigationItem.rightBarButtonItem = rightBtn
        // wishVC.navigationItem.rightBarButtonItem = rightBtn
         self.navigationItem.leftBarButtonItem = leftBtn
     }

}

extension WishListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.wishListTableViewCell) as! WishListTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 189.0
    }
    
}
