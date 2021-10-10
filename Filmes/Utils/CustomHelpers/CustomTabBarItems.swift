//
//  TabBarConfigurators.swift
//  TabBarConfigurators
//
//  Created by Filipe Oliveira on 07/10/21.
//

import Foundation
import UIKit

extension UITabBarItem {
  static var homeTabBarItem: UITabBarItem {
    UITabBarItem(title: "Início",
                 image: UIImage(systemName: "house"),
                 selectedImage: UIImage(systemName: "house.fill"))
  }
  
  static var searchTabBarItem: UITabBarItem {
    UITabBarItem(title: "Busca",
                 image: UIImage(systemName: "magnifyingglass"),
                 selectedImage: UIImage(systemName: "sparkle.magnifyingglass"))
  }
  
  static var watchedTabBarItem: UITabBarItem {
    UITabBarItem(title: "Assistidos",
                 image: UIImage(systemName: "eye"),
                 selectedImage: UIImage(systemName: "eye.fill"))
  }
  
  static var profileTabBarItem: UITabBarItem {
    UITabBarItem(title: "Perfil",
                 image: UIImage(systemName: "person"),
                 selectedImage: UIImage(systemName: "person.fill"))
  }
}
