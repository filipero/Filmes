//
//  CGFloat+Extensions.swift
//  CGFloat+Extensions
//
//  Created by Filipe Oliveira on 09/10/21.
//

import UIKit

extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}
