//
//  WishListTableViewCell.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class WishListTableViewCell: UITableViewCell {

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
}
