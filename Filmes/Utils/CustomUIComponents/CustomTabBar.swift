//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Filipe Oliveira on 07/10/21.
//

import UIKit

class CustomTabBar: UITabBarController {
  override func viewDidLoad() {
    tabBar.backgroundColor = .systemBackground
    tabBar.layer.borderWidth = 0.5
    tabBar.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.5).cgColor
    view.tintColor = .systemGray
  }
}
