//
//  detailsViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import Foundation

protocol detailsNavigationDelegate: AnyObject {

}

protocol detailsViewModelProtocol: AnyObject {

}

class detailsViewModel {
  private var service: detailsWorkerProtocol
  private weak var navigationDelegate: detailsNavigationDelegate?
  
  init(service: detailsWorkerProtocol = detailsWorker(),
       navigationDelegate: detailsNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - detailsViewModelProtocol

extension detailsViewModel: detailsViewModelProtocol { }
