//
//  HomeModelsGenreFixture.swift
//  HomeModelsGenreFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

extension HomeModels.Genre {
  static func fixture(id: Int = 0,
                      name: String = "") -> Self {
    .init(id: id,
          name: name)
  }
}
