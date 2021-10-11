//
//  SearchViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

//MARK: - SearchNavigationDelegate

protocol SearchNavigationDelegate: AnyObject {

}

//MARK: - SearchViewModelProtocol

protocol SearchViewModelProtocol: AnyObject {
  var underConstructionImage: UIImage? { get }
  var underConstructionText: String { get }
}

//MARK: - SearchViewModel

class SearchViewModel {
  private var service: SearchWorkerProtocol
  private weak var navigationDelegate: SearchNavigationDelegate?
  
  var underConstructionText: String = "Esta funcionalidade está em construção!"
  var underConstructionImage: UIImage? = UIImage(systemName: "exclamationmark.triangle")
  
  init(service: SearchWorkerProtocol = SearchWorker(),
       navigationDelegate: SearchNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - SearchViewModelProtocol

extension SearchViewModel: SearchViewModelProtocol { }
