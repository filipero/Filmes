//
//  HomeModelsPopularMoviesFixture.swift
//  HomeModelsPopularMoviesFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

extension HomeModels.PopularMoviesResponse {
  static func fixture(page: Int = 0,
                      results: [HomeModels.Result] = [],
                      totalPages: Int = 0,
                      totalResults: Int = 0) -> Self {
    .init(page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults)
  }
}
