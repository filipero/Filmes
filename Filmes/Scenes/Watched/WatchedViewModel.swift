//
//  WatchedViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

//MARK: - WatchedNavigationDelegate

protocol WatchedNavigationDelegate: AnyObject {

}

//MARK: - WatchedViewModelProtocol

protocol WatchedViewModelProtocol: AnyObject {
  var underConstructionImage: UIImage? { get }
  var underConstructionText: String { get }
}

//MARK: - WatchedViewModel

class WatchedViewModel {
  private var service: WatchedWorkerProtocol
  private weak var navigationDelegate: WatchedNavigationDelegate?
  
  var underConstructionText: String = "Esta funcionalidade está em construção!"
  var underConstructionImage: UIImage? = UIImage(systemName: "exclamationmark.triangle")
  
  init(service: WatchedWorkerProtocol = WatchedWorker(),
       navigationDelegate: WatchedNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - WatchedViewModelProtocol

extension WatchedViewModel: WatchedViewModelProtocol { }
