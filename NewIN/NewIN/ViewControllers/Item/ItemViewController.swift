//
//  ItemViewController.swift
//  NewIN
//
//  Created by Sagar Chavan on 08/03/22.
//

import UIKit

class ItemViewController: UIViewController {
    
    var itemData = [Item]()
    var indexPath : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(itemData[indexPath!].brand)
        print(itemData[indexPath!].name)
        print(itemData[indexPath!].price)
        print(itemData[indexPath!].image)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
