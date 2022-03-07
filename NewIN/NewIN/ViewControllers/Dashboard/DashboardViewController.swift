//
//  ViewController.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import UIKit

class DashboardViewController: UIViewController {

    var dashboardVM = DashboardviewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getReview()
    }

    
    func getReview() {
        dashboardVM.apiAllItems() { items, Error in
            if let allIteams = items {
                print(allIteams)
            }
        }
    }

}

