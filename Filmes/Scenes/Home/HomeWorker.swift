//
//  HomeWorker.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol HomeWorkerProtocol: AnyObject {
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping ([HomeModels.MovieData]) -> Void)
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping([HomeModels.MovieData]) -> Void)
  func requestMovieGenres(completionHandler: @escaping ([HomeModels.Genre]) -> Void)
  func requestConfiguration(completionHandler: @escaping () -> Void)
}

class HomeWorker {
  private var session: SessionCore
  
  init() {
    let sessionData = SessionCore.SessionData(imageSecureBaseUrl: "")
    SessionCore.createSession(sessionData)
    self.session = SessionCore.shared
  }
  
}

//MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
  func requestConfiguration(completionHandler: @escaping () -> Void) {
    let baseUrl = session.serverSecureBaseUrl
    let apiKey = session.apiKey
    guard let url = URL(string: "\(baseUrl)configuration?api_key=\(apiKey)") else { return }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              print("error")
              return
            }
      if let data = data,
         let configData = try? JSONDecoder().decode(HomeModels.Image.self, from: data) {
        let sessionData = SessionCore.SessionData(imageSecureBaseUrl: configData.images.secureBaseURL)
        SessionCore.createSession(sessionData)
        
        completionHandler()
      }
    })
    task.resume()
  }
  
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping([HomeModels.MovieData]) -> Void) {
    let baseUrl = session.serverSecureBaseUrl
    let apiKey = session.apiKey
    let language = session.defaultLanguage
    guard let url = URL(string: "\(baseUrl)movie/now_playing?api_key=\(apiKey)&language=\(language)&page=\(page)") else { return }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              print("error")
              return
            }
      
      if let data = data,
         let response = try? JSONDecoder().decode(HomeModels.NowPlayingResponse.self, from: data) {
        let movieList = response.results.map {
          HomeModels.MovieData(adult: $0.adult,
                               backdropPath: $0.backdropPath,
                               genreIDS: $0.genreIDS,
                               id: $0.id,
                               originalLanguage: $0.originalLanguage,
                               originalTitle: $0.originalTitle,
                               overview: $0.overview,
                               popularity: $0.popularity,
                               posterPath: $0.posterPath,
                               releaseDate: $0.releaseDate,
                               title: $0.title,
                               video: $0.video,
                               voteAverage: $0.voteAverage,
                               voteCount: $0.voteCount)
        }
        completionHandler(movieList)
      }
    })
    task.resume()
  }
  
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping ([HomeModels.MovieData]) -> Void) {
    let baseUrl = session.serverSecureBaseUrl
    let apiKey = session.apiKey
    let language = session.defaultLanguage
    
    guard let url = URL(string: "\(baseUrl)movie/popular?api_key=\(apiKey)&language=\(language)&page=\(page)") else { return }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              print("error")
              return
            }
      
      if let data = data,
         let response = try? JSONDecoder().decode(HomeModels.PopularMoviesResponse.self, from: data) {
        let movieList = response.results.map {
          HomeModels.MovieData(adult: $0.adult,
                               backdropPath: $0.backdropPath,
                               genreIDS: $0.genreIDS,
                               id: $0.id,
                               originalLanguage: $0.originalLanguage,
                               originalTitle: $0.originalTitle,
                               overview: $0.overview,
                               popularity: $0.popularity,
                               posterPath: $0.posterPath,
                               releaseDate: $0.releaseDate,
                               title: $0.title,
                               video: $0.video,
                               voteAverage: $0.voteAverage,
                               voteCount: $0.voteCount)
        }
        completionHandler(movieList)
      }
    })
    task.resume()
  }
  
  func requestMovieGenres(completionHandler: @escaping ([HomeModels.Genre]) -> Void) {
    let baseUrl = session.serverSecureBaseUrl
    let apiKey = session.apiKey
    let language = session.defaultLanguage
    guard let url = URL(string: "\(baseUrl)genre/movie/list?api_key=\(apiKey)&language=\(language)") else { return }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching genres: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              print("error")
              return
            }
      
      if let data = data,
         let genreList = try? JSONDecoder().decode(HomeModels.GenresResponse.self, from: data) {
        completionHandler(genreList.genres)
      }
    })
    task.resume()
  }
}
