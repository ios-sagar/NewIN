//
//  Router.swift
//  NewIN
//
//  Created by Sagar Chavan on 07/03/22.
//

import Foundation
import UIKit

class Router: NSObject {

  static func getControllerWith(identifier: String) -> UIViewController {
    let storyBoard = UIStoryboard.init(name: Constants.storyboard, bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: identifier)
    return controller
  }
}
