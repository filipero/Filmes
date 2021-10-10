//
//  HomeModelsResultFixture.swift
//  HomeModelsResultFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

extension HomeModels.Result {
  static func fixture(adult: Bool = false,
                      backdropPath: String = "",
                      genreIDS: [Int] = [],
                      id: Int = 0,
                      originalLanguage: String = "",
                      originalTitle: String = "",
                      overview: String = "",
                      popularity: Double = 0,
                      posterPath: String = "",
                      releaseDate: String = "",
                      title: String = "",
                      video: Bool = false,
                      voteAverage: Double = 0,
                      voteCount: Int = 0) -> Self {
    .init(adult: adult,
          backdropPath: backdropPath,
          genreIDS: genreIDS,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount)
  }
}
