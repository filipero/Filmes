//
//  HomeNavigationDelegateSpy.swift
//  HomeNavigationDelegateSpy
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

//MARK: - HomeNavigationDelegateSpy

final class HomeNavigationDelegateSpy: HomeNavigationDelegate {
  var didGoToMovieDetails: Bool = false
  var movieIdPassed: Int = 0
  func goToMovieDetails(movieId: Int) {
    didGoToMovieDetails = true
    movieIdPassed = movieId
  }
  
  var didGoToMovieList: Bool = false
  var genrePassed: HomeModels.Genre = .fixture()
  func goToMovieList(withGenre genre: HomeModels.Genre) {
    didGoToMovieList = true
    genrePassed = genre
  }
}
