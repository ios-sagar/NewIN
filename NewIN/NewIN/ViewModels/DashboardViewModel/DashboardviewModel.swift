//
//  DashboardviewModel.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import Foundation

struct NewIN: Codable {
    let title, currency: String
    let items: [Item]
}

struct Item: Codable {
    let id, sku: String
    let image: String
    let brand, name: String
    let price: Int
    let originalPrice: Int?
    let badges: [String]
}


class DashboardviewModel: NSObject {
    var networkManager = NetworkManager()
    func apiAllItems (completion: @escaping (NewIN?, Error?) -> Void) {
        if let allItemsURL = RequestManager.getItemsRequest() {
            networkManager.getDataFrom(url: allItemsURL) { items, error in
                if let exception = error {
                    completion(nil, exception)
                } else {
                    completion(items, nil)
                }
            }
        }
    }
}
