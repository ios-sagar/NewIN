//
//  Constants.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import Foundation

struct Constants {
    static let storyboard = "Main"
    static let getIteamList = "https://run.mocky.io/v3/5c138271-d8dd-4112-8fb4-3adb1b7f689e"
    
    static let itemCollectionViewCell = "ItemCollectionViewCell"
    static let itelCollectionCellID = "ItemCollectionViewCellID"
    static let wishListTableViewCell = "WishListTableViewCell"
}

enum Views: String {
  case dashboard = "DashboardViewController"
  case wishlist = "WishListViewController"
  case itemView = "ItemViewController"
}
