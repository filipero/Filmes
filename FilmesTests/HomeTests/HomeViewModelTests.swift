//
//  HomeViewModelTests.swift
//  HomeViewModelTests
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation
@testable import Filmes
import XCTest

final class HomeViewModelTests: XCTestCase {
  var sut: HomeViewModel!
  var homeNavigationDelegate: HomeNavigationDelegateSpy!
  var homeWorkerMock: HomeWorkerMock!
  
  private func makeSut() {
    sut = HomeViewModel(service: homeWorkerMock,
                        navigationDelegate: homeNavigationDelegate)
  }
  
  override func setUp() {
    homeNavigationDelegate = HomeNavigationDelegateSpy()
    homeWorkerMock = HomeWorkerMock()
  }
  
  func test_RequestConfiguration_ShouldBeCalled() {
    makeSut()
    XCTAssert(homeWorkerMock.requestConfigurationCalled)
  }
  
  func test_RequestConfiguration_ShouldBeCalledOnce() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestConfigurationCallCount, 1)
  }
  
  func test_RequestPopularMovies_ShouldBeCalled() {
    makeSut()
    XCTAssert(homeWorkerMock.requestPopularMoviesCalled)
  }
  
  func test_RequestPopularMovies_ShouldBeCalledOnce() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestPopularMoviesCallCount, 1)
  }
  
  func test_RequestPopularMovies_ShouldRequestFirstPage() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestPopularMoviesPagePassed, 1)
  }
  
  func test_RequestPopularMovies_ImagesSecureBaseUrlShouldNotBeNil() {
    homeWorkerMock.configuration = .fixture(images: .fixture(secureBaseURL: "Teste"))
    makeSut()
    XCTAssertNotNil(homeWorkerMock.configuration?.images.secureBaseURL)
  }
  
  func test_RequestNowPlaying_ShouldBeCalled() {
    makeSut()
    XCTAssert(homeWorkerMock.requestNowPlayingMoviesCalled)
  }
  
  func test_RequestNowPlaying_ShouldBeCalledOnce() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestNowPlayingMoviesCallCount, 1)
  }
  
  func test_RequestNowPlaying_ShouldRequestFirstPage() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestNowPlayingMoviesPagePassed, 1)
  }
  
  func test_RequestGenresList_ShouldBeCalled() {
    makeSut()
    XCTAssert(homeWorkerMock.requestMovieGenresCalled)
  }
  
  func test_RequestGenresList_ShouldBeCalledOnce() {
    makeSut()
    XCTAssertEqual(homeWorkerMock.requestMovieGenresCallCount, 1)
  }
  
  func test_goToMovieDetails_movieIdNotZero() {
    homeNavigationDelegate.goToMovieDetails(movieId: 1)
    XCTAssertNotEqual(homeNavigationDelegate.movieIdPassed, 0)
  }
  
  func test_goToMovieDetails_ShouldBeCalled() {
    homeNavigationDelegate.goToMovieDetails(movieId: 1)
    XCTAssert(homeNavigationDelegate.didGoToMovieDetails)
  }
  
  func test_goToMovieList_GenreIsValid() {
    homeNavigationDelegate.goToMovieList(withGenre: .init(id: 1, name: "Genre"))
    XCTAssertEqual(homeNavigationDelegate.genrePassed.id, 1)
    XCTAssertEqual(homeNavigationDelegate.genrePassed.name, "Genre")
  }
  
  func test_goToMovieList_ShouldBeCalled() {
    homeNavigationDelegate.goToMovieList(withGenre: .fixture())
    XCTAssert(homeNavigationDelegate.didGoToMovieList)
  }
}
