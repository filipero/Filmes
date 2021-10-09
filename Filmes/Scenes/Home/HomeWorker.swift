//
//  HomeWorker.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol HomeWorkerProtocol: AnyObject {
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping (HomeModels.PopularMoviesResponse) -> Void)
}

class HomeWorker {

}

//MARK: - HomeWorkerProtocol

extension HomeWorker: HomeWorkerProtocol {
  func requestPopularMovies(atPage page: Int, completionHandler: @escaping (HomeModels.PopularMoviesResponse) -> Void) {
    let apiKey: String = "5bb425e36318deff6fd66b834ae1e726"
    let language: String = "pt-BR"
    guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=\(language)&page=\(page)") else { return }
    
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
}
