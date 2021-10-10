//
//  detailsViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import Foundation

//MARK: - detailsNavigationDelegate

protocol detailsNavigationDelegate: AnyObject {

}

//MARK: - detailsViewModelProtocol

protocol detailsViewModelProtocol: AnyObject {

}

//MARK: - detailsViewModel

class detailsViewModel {
  private var service: detailsWorkerProtocol
  private weak var navigationDelegate: detailsNavigationDelegate?
  private var movieId: Int
  
  init(service: detailsWorkerProtocol = detailsWorker(),
       navigationDelegate: detailsNavigationDelegate? = nil,
       movieId: Int) {
    self.service = service
    self.navigationDelegate = navigationDelegate
    self.movieId = movieId
  }
}

//MARK: - detailsViewModelProtocol

extension detailsViewModel: detailsViewModelProtocol { }
