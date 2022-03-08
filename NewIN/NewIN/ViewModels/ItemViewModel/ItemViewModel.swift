//
//  ItemViewModel.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import Foundation
import UIKit


class ItemViewModel: NSObject {
    
    var isAddedToWishList = true
    
    func addToWishListClicked(btn_wishlist: UIButton, itemValue: [Item]){
        for index in 0...itemValue.count{
            isAddedToWishList = !isAddedToWishList
            if isAddedToWishList {
                btn_wishlist.backgroundColor = .clear
                Global.sharedInstance.itemValues.remove(at: index)
                break
            } else {
                btn_wishlist.backgroundColor = .lightGray
                Global.sharedInstance.itemValues.append(itemValue[index])
                break
            }
        }
        print(Global.sharedInstance.itemValues)
    }
}
