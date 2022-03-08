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
    
    var itemValue = [Item]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        underlineButton(button: btn_remove, text: "Remove")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: Constants.wishListTableViewCell, bundle: nil)
    }
    
    func configureCell(item:[Item], indexPath:Int){
        self.itemValue = item
        self.lbl_brand.text = item[indexPath].brand
        self.lbl_name.text = item[indexPath].name
        self.lbl_price.text = String(item[indexPath].price) + " AED"
        let url = URL(string: item[indexPath].image)!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.img_itemImg.image = UIImage(data: data)
                }
            }
        }
        btn_remove.tag = indexPath+1
    }
    
    func underlineButton(button : UIButton, text: String) {
        let titleString : NSMutableAttributedString = NSMutableAttributedString(string: text)
        titleString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, (text.utf8).count))
        btn_remove.setAttributedTitle(titleString, for: .normal)
    }
    
    @IBAction func removeBtnClicked(_ sender: Any) {
        for index in 1...self.itemValue.count{
            if index == btn_remove.tag{
                Global.sharedInstance.itemValues = Global.sharedInstance.itemValues.filter({$0.id != String(index)})
            }
        }
    }
}
