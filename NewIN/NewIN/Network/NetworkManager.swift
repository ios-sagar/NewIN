//
//  NetworkManager.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import Foundation
import Alamofire

class NetworkManager: NSObject {

    func getDataFrom(url: URL, completion: @escaping (NewIN?, Error?) -> Void) {
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let reviews = try JSONDecoder().decode(NewIN.self, from: data)
                completion(reviews, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
