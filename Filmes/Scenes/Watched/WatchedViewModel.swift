//
//  WatchedViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol WatchedNavigationDelegate: AnyObject {

}

protocol WatchedViewModelProtocol: AnyObject {

}

class WatchedViewModel {
  private var service: WatchedWorkerProtocol
  private weak var navigationDelegate: WatchedNavigationDelegate?
  
  init(service: WatchedWorkerProtocol = WatchedWorker(),
       navigationDelegate: WatchedNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - WatchedViewModelProtocol

extension WatchedViewModel: WatchedViewModelProtocol { }
