//
//  HomeModelsDatesFixture.swift
//  HomeModelsDatesFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes


extension HomeModels.Dates {
  static func fixture(maximum: String = "",
                      minimum: String = "") -> Self {
    .init(maximum: maximum,
          minimum: minimum)
  }
}
