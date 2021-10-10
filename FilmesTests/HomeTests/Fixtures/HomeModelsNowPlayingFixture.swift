//
//  HomeModelsNowPlayingFixture.swift
//  HomeModelsNowPlayingFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

extension HomeModels.NowPlayingResponse {
  static func fixture(dates: HomeModels.Dates = .fixture(),
                      page: Int = 0,
                      results: [HomeModels.Result] = [],
                      totalPages: Int = 0,
                      totalResults: Int = 0) -> Self {
    .init(dates: dates,
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults)
  }
  
}
