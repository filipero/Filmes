//
//  HomeModelsImageFixture.swift
//  HomeModelsImageFixture
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

extension HomeModels.Image {
  static func fixture(images: HomeModels.Images = .fixture(),
                      changeKeys: [String] = []) -> Self {
    .init(images: images,
          changeKeys: changeKeys)
  }
}

extension HomeModels.Images {
  static func fixture(baseURL: String = "",
                      secureBaseURL: String = "",
                      backdropSizes: [String] = [],
                      logoSizes: [String] = [],
                      posterSizes: [String] = [],
                      profileSizes: [String] = [],
                      stillSizes: [String] = []) -> Self {
    .init(baseURL: baseURL,
          secureBaseURL: secureBaseURL,
          backdropSizes: backdropSizes,
          logoSizes: logoSizes,
          posterSizes: posterSizes,
          profileSizes: profileSizes,
          stillSizes: stillSizes)
    
  }
}
