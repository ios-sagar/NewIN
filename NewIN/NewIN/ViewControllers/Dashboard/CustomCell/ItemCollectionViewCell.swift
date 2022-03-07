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
    @IBOutlet weak var lbl_badheValueThree: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(item:[Item], indexPath:Int){
        self.lbl_brand.text = item[indexPath].brand
        self.lbl_itemName.text = item[indexPath].name
        self.lbl_price.text = String(item[indexPath].price) + " AED"
        self.lbl_badgeValueOne.text = item[indexPath].badges.first
        self.lbl_badgeValueTwo.text = item[indexPath].badges.first
        self.lbl_badheValueThree.text = item[indexPath].badges.first
        let url = URL(string: item[indexPath].image)!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.img_itemImage.image = UIImage(data: data)
                }
            }
        }
    }
    
}
