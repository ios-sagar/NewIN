//
//  ItemViewController.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class ItemViewController: UIViewController {
    
    var itemData = [Item]()
    var indexPath : Int?
    @IBOutlet weak var Lbl_badgeOne: UILabel!
    @IBOutlet weak var Lbl_badgeTwo: UILabel!
    @IBOutlet weak var img_itemImg: UIImageView!
    @IBOutlet weak var lbl_brandName: UILabel!
    @IBOutlet weak var lbl_ItemName: UILabel!
    @IBOutlet weak var lbl_itemPrice: UILabel!
    @IBOutlet weak var btn_AddToCart: UIButton!
    var isChecked = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateUI()
    }
    
    
    // MARK: - user defined methods
    func initiateUI(){
        let url = URL(string: itemData[indexPath!].image)!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.img_itemImg.image = UIImage(data: data)
                }
            }
        }
        lbl_brandName.text = itemData[indexPath!].brand
        lbl_ItemName.text = itemData[indexPath!].name
        lbl_itemPrice.text = String(itemData[indexPath!].price) + " AED"
        if(itemData[indexPath!].badges.count == 1){
            Lbl_badgeOne.text = itemData[indexPath!].badges[0]
        }else if(itemData[indexPath!].badges.count == 2){
            Lbl_badgeOne.text = itemData[indexPath!].badges[0]
            Lbl_badgeTwo.text = itemData[indexPath!].badges[1]
        }
        btn_AddToCart.setTitle("ADD TO CART", for: .normal)
        btn_AddToCart.backgroundColor = .black
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
        isChecked = !isChecked
        if isChecked {
            btn_AddToCart.setTitle("ADD TO CART", for: .normal)
            btn_AddToCart.backgroundColor = .black
        } else {
            btn_AddToCart.setTitle("ITEM IS IN CART", for: .normal)
            btn_AddToCart.backgroundColor = .lightGray
        }
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
