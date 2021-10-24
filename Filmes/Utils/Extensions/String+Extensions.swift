//
//  String+Extensions.swift
//  String+Extensions
//
//  Created by Filipe Oliveira on 23/10/21.
//

import Foundation

public extension String {
  var inDDMMYYYY: String {
    let dfc = DateFormatter()
    dfc.calendar = Calendar(identifier: .gregorian)
    dfc.locale = Locale(identifier: "pt_BR")
    dfc.dateFormat = "yyyy-MM-dd"
    guard let date = dfc.date(from: self) else { return self}
    dfc.dateFormat = "dd/MM/yyyy"
    return dfc.string(from: date)
  }
}
