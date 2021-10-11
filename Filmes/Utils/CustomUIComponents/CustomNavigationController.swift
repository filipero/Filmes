//
//  CustomNavigationController.swift
//  CustomNavigationController
//
//  Created by Filipe Oliveira on 10/10/21.
//

import UIKit

class CustomNavigationController: UINavigationController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.backButtonTitle = " "
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.tintColor = .red
  }
}
