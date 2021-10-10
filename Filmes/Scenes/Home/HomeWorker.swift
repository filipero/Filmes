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

}

//MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
  static var configuration: HomeModels.Image?
  static var baseUrl: String = "https://api.themoviedb.org/3/"
  static var apiKey: String = "5bb425e36318deff6fd66b834ae1e726"
  static var language: String = "pt-BR"
  
  func requestConfiguration(completionHandler: @escaping () -> Void) {
    guard let url = URL(string: "\(HomeWorker.baseUrl)configuration?api_key=\(HomeWorker.apiKey)") else { return }
    
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
        HomeWorker.configuration = configData
        completionHandler()
      }
    })
    task.resume()
  }
  
  func requestNowPlayingMovies(atPage page: Int, completionHandler: @escaping(HomeModels.NowPlayingResponse) -> Void) {
    guard let url = URL(string: "\(HomeWorker.baseUrl)movie/now_playing?api_key=\(HomeWorker.apiKey)&language=\(HomeWorker.language)&page=\(page)") else { return }
    
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
    guard let url = URL(string: "\(HomeWorker.baseUrl)movie/popular?api_key=\(HomeWorker.apiKey)&language=\(HomeWorker.language)&page=\(page)") else { return }
    
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
    guard let url = URL(string: "\(HomeWorker.baseUrl)genre/movie/list?api_key=\(HomeWorker.apiKey)&language=\(HomeWorker.language)") else { return }
    
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
