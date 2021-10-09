//
//  SearchViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol SearchNavigationDelegate: AnyObject {

}

protocol SearchViewModelProtocol: AnyObject {

}

class SearchViewModel {
  private var service: SearchWorkerProtocol
  private weak var navigationDelegate: SearchNavigationDelegate?
  
  init(service: SearchWorkerProtocol = SearchWorker(),
       navigationDelegate: SearchNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - SearchViewModelProtocol

extension SearchViewModel: SearchViewModelProtocol { }
