//
//  Constraints.swift
//  Constraints
//
//  Created by Filipe Oliveira on 08/10/21.
//

import UIKit

public enum Constants: CGFloat {
  /// 0
  case zero = 0
  /// 4
  case small = 4
  /// 8
  case medium = 8
  /// 16
  case large = 16
  /// 32
  case huge = 32
}

extension UIView {
  public func anchor(topAnchor: NSLayoutYAxisAnchor? = nil, _ topConstant: Constants = .zero,
              leadingAnchor: NSLayoutXAxisAnchor? = nil, _ leadingConstant: Constants = .zero,
              trailingAnchor: NSLayoutXAxisAnchor? = nil, _ trailingConstant: Constants = .zero,
              bottomAnchor: NSLayoutYAxisAnchor? = nil, _ bottomConstant: Constants = .zero) {
    if let topAnchor = topAnchor {
      self.topAnchor.constraint(equalTo: topAnchor,
                                constant: topConstant.rawValue).isActive = true
    }
    
    if let leadingAnchor = leadingAnchor {
      self.leadingAnchor.constraint(equalTo: leadingAnchor,
                                    constant: leadingConstant.rawValue).isActive = true
    }
    
    if let trailingAnchor = trailingAnchor {
      self.trailingAnchor.constraint(equalTo: trailingAnchor,
                                     constant: -trailingConstant.rawValue).isActive = true
    }
    
    if let bottomAnchor = bottomAnchor {
      self.bottomAnchor.constraint(equalTo: bottomAnchor,
                                   constant: -bottomConstant.rawValue).isActive = true
    }
  }
  
  public func size(heightAnchor: NSLayoutDimension?, _ heightConstant: Constants? = .zero,
                   widthAnchor: NSLayoutDimension?, _ widthConstant: Constants? = .zero) {
    if let heightAnchor = heightAnchor,
       let heightConstant = heightConstant {
      self.heightAnchor.constraint(equalTo: heightAnchor,
                                   constant: heightConstant.rawValue).isActive = true
    }
    
    if let widthAnchor = widthAnchor,
       let widthConstant = widthConstant {
      self.widthAnchor.constraint(equalTo: widthAnchor,
                                  constant: widthConstant.rawValue).isActive = true
    }
  }
}
