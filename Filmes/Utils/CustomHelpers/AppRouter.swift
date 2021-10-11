//
//  AppRouter.swift
//  AppRouter
//
//  Created by Filipe Oliveira on 07/10/21.
//

import Foundation
import UIKit

class AppRouter: Router {
  let window: UIWindow
  var childRouters: [Router] = []
  var rootViewController: UIViewController {
    return self.navigationController
  }

  lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    return navigationController
  }()

  init(window: UIWindow) {
    self.window = window
    self.window.rootViewController = self.rootViewController
    self.window.makeKeyAndVisible()
  }

  func start() {
    let homeRouter = MainRouter(presenter: navigationController, navigationDelegate: self)
    addChildRouter(homeRouter)
    homeRouter.start()
  }
}

extension AppRouter: RouterDelegate {
  func didClose(childRouter: Router) {
    removeChildRouter(childRouter)
  }
}

