//
//  detailsViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import Foundation

//MARK: - DetailsNavigationDelegate

protocol DetailsNavigationDelegate: AnyObject {

}

//MARK: - DetailsViewModelProtocol

protocol DetailsViewModelProtocol: AnyObject {

}

//MARK: - DetailsViewModel

class DetailsViewModel {
  private var service: DetailsWorkerProtocol
  private weak var navigationDelegate: DetailsNavigationDelegate?
  private var movieId: Int
  
  init(service: DetailsWorkerProtocol = DetailsWorker(),
       navigationDelegate: DetailsNavigationDelegate? = nil,
       movieId: Int) {
    self.service = service
    self.navigationDelegate = navigationDelegate
    self.movieId = movieId
  }
}

//MARK: - DetailsViewModelProtocol

extension DetailsViewModel: DetailsViewModelProtocol { }
