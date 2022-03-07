//
//  RequestManager.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import Foundation
class RequestManager: NSObject {
    
    static func getItemsRequest() -> URL? {
        return URL(string: Constants.getIteamList)!
    }
}
