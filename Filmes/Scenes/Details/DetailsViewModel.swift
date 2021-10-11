//
//  detailsViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import UIKit

//MARK: - DetailsNavigationDelegate

protocol DetailsNavigationDelegate: AnyObject {

}

//MARK: - DetailsViewModelProtocol

protocol DetailsViewModelProtocol: AnyObject {
  var underConstructionImage: UIImage? { get }
  var underConstructionText: String { get }
}

//MARK: - DetailsViewModel

class DetailsViewModel {
  private var service: DetailsWorkerProtocol
  private weak var navigationDelegate: DetailsNavigationDelegate?
  private var movieId: Int
  var underConstructionText: String = "Esta funcionalidade está em construção!"
  var underConstructionImage: UIImage? = UIImage(systemName: "exclamationmark.triangle")
  
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
