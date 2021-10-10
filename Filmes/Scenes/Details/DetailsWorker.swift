//
//  detailsWorker.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import Foundation

//MARK: - DetailsWorkerProtocol

protocol DetailsWorkerProtocol: AnyObject {
  func requestMovieDetails(movieId: Int, completionHandler: @escaping () -> Void)
}

//MARK: DetailsWorker

class DetailsWorker {
//https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
}

//MARK: - DetailsWorkerProtocol

extension DetailsWorker: DetailsWorkerProtocol {
  func requestMovieDetails(movieId: Int, completionHandler: @escaping () -> Void) {
  }
}
