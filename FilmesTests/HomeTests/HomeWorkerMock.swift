//
//  HomeWorkerMock.swift
//  HomeWorkerMock
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes

class HomeWorkerMock: HomeWorkerProtocol {
  var configuration: HomeModels.Image?
  
  var requestPopularMoviesCalled: Bool = false
  var requestPopularMoviesCallCount: Int = 0
  var requestPopularMoviesPagePassed: Int = 0
  var requestPopularMoviesCompletion: HomeModels.PopularMoviesResponse = .fixture()
  
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping (HomeModels.PopularMoviesResponse) -> Void) {
    requestPopularMoviesCalled = true
    requestPopularMoviesCallCount += 1
    requestPopularMoviesPagePassed = page
    completionHandler(requestPopularMoviesCompletion)
  }
  
  var requestNowPlayingMoviesCalled: Bool = false
  var requestNowPlayingMoviesCallCount: Int = 0
  var requestNowPlayingMoviesPagePassed: Int = 0
  var requestNowPlayingMoviesCompletion: HomeModels.NowPlayingResponse = .fixture()
  
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping (HomeModels.NowPlayingResponse) -> Void) {
    requestNowPlayingMoviesCalled = true
    requestNowPlayingMoviesCallCount += 1
    requestNowPlayingMoviesPagePassed = page
    completionHandler(requestNowPlayingMoviesCompletion)
  }
  
  var requestMovieGenresCalled: Bool = false
  var requestMovieGenresCallCount: Int = 0
  var requestMovieGenresCompletion: HomeModels.GenresResponse = .init(genres: [])
  
  func requestMovieGenres(completionHandler: @escaping (HomeModels.GenresResponse) -> Void) {
    requestMovieGenresCalled = true
    requestMovieGenresCallCount += 1
    completionHandler(requestMovieGenresCompletion)
  }
  
  var requestConfigurationCalled: Bool = false
  var requestConfigurationCallCount: Int = 0
  
  func requestConfiguration(completionHandler: @escaping () -> Void) {
    requestConfigurationCalled = true
    requestConfigurationCallCount += 1
    completionHandler()
  }
}
