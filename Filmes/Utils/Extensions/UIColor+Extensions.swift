//
//  UIColor+Extensions.swift
//  UIColor+Extensions
//
//  Created by Filipe Oliveira on 09/10/21.
//

import UIKit

extension UIColor {
  static func random() -> UIColor {
    return UIColor(red: .random(),
                   green: .random(),
                   blue: .random(),
                   alpha: 0.5)
  }
}
