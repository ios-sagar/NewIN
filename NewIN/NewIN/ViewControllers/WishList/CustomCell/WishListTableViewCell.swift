//
//  WishListTableViewCell.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class WishListTableViewCell: UITableViewCell {

    @IBOutlet weak var img_itemImg: UIImageView!
    @IBOutlet weak var lbl_brand: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var btn_remove: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: Constants.wishListTableViewCell, bundle: nil)
    }
    
    func configureCell(){
        self.lbl_brand.text = "OFF-WHITE"
        self.lbl_name.text = "Odsy-2000 sneakers"
        self.lbl_price.text = "2580 AED"
        let url = URL(string: "https://i.imgur.com/oNo46c2m.jpg")!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.img_itemImg.image = UIImage(data: data)
                }
            }
        }
    }
    @IBAction func removeBtnClicked(_ sender: Any) {
    }
}
