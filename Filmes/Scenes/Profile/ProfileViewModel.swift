//
//  ProfileViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import UIKit

//MARK: - ProfileNavigationDelegate

protocol ProfileNavigationDelegate: AnyObject {

}

//MARK: - ProfileViewModelProtocol

protocol ProfileViewModelProtocol: AnyObject {
  var underConstructionImage: UIImage? { get }
  var underConstructionText: String { get }
}

//MARK: - ProfileViewModel

class ProfileViewModel {
  private var service: ProfileWorkerProtocol
  private weak var navigationDelegate: ProfileNavigationDelegate?
  
  var underConstructionText: String = "Esta funcionalidade está em construção!"
  var underConstructionImage: UIImage? = UIImage(systemName: "exclamationmark.triangle")
  
  init(service: ProfileWorkerProtocol = ProfileWorker(),
       navigationDelegate: ProfileNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - ProfileViewModelProtocol

extension ProfileViewModel: ProfileViewModelProtocol { }
