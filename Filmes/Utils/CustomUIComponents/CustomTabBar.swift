//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Filipe Oliveira on 07/10/21.
//

import UIKit

class CustomTabBar: UITabBarController {
  override func viewDidLoad() {
    tabBar.backgroundColor = .white
    tabBar.layer.borderWidth = 0.5
    tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
    view.tintColor = .gray
  }
}
