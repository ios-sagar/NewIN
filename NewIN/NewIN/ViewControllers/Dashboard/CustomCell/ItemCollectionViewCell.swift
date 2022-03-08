//
//  ItemCollectionViewCell.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl_brand: UILabel!
    @IBOutlet weak var lbl_itemName: UILabel!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var img_itemImage: UIImageView!
    @IBOutlet weak var lbl_badgeValueOne: UILabel!
    @IBOutlet weak var btn_wishlist: UIButton!
    @IBOutlet weak var lbl_badgeValueTwo: UILabel!
    
    var itemValue = [Item]()
    var isAddedToWishList = true
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(item:[Item], indexPath:Int){
        self.itemValue = item
        self.lbl_brand.text = item[indexPath].brand
        self.lbl_itemName.text = item[indexPath].name
        self.lbl_price.text = String(item[indexPath].price) + " AED"
        if(item[indexPath].badges.count == 1){
            lbl_badgeValueOne.text = item[indexPath].badges[0]
        }else if(item[indexPath].badges.count == 2){
            lbl_badgeValueOne.text = item[indexPath].badges[0]
            lbl_badgeValueTwo.text = item[indexPath].badges[1]
        }
        let url = URL(string: item[indexPath].image)!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.img_itemImage.image = UIImage(data: data)
                }
            }
        }
        btn_wishlist.tag = indexPath+1
    }
    
    @IBAction func addToWishListClicked(_ sender: Any) {
        for index in 1...self.itemValue.count{
            if index == btn_wishlist.tag{
                isAddedToWishList = !isAddedToWishList
                if isAddedToWishList {
                    btn_wishlist.backgroundColor = .clear
                    //remove from array
                    Global.sharedInstance.itemValues = Global.sharedInstance.itemValues.filter({$0.id != String(index)})
                } else {
                    btn_wishlist.backgroundColor = .lightGray
                    //add to array
                    Global.sharedInstance.itemValues.append(itemValue[btn_wishlist.tag-1])
                }
            }
        }
    }
}
