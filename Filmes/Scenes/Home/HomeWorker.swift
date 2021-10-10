//
//  HomeWorker.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol HomeWorkerProtocol: AnyObject {
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping (HomeModels.PopularMoviesResponse) -> Void)
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping(HomeModels.NowPlayingResponse) -> Void)
  func requestMovieGenres(completionHandler: @escaping (HomeModels.GenresResponse) -> Void)
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
  
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping(HomeModels.NowPlayingResponse) -> Void) {
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
         let movieList = try? JSONDecoder().decode(HomeModels.NowPlayingResponse.self, from: data) {
        completionHandler(movieList)
      }
    })
    task.resume()
  }
  
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping (HomeModels.PopularMoviesResponse) -> Void) {
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
         let movieList = try? JSONDecoder().decode(HomeModels.PopularMoviesResponse.self, from: data) {
        completionHandler(movieList)
      }
    })
    task.resume()
  }
  
  func requestMovieGenres(completionHandler: @escaping (HomeModels.GenresResponse) -> Void) {
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
        completionHandler(genreList)
      }
    })
    task.resume()
  }
}
