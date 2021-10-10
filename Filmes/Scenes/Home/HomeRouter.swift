//
//  HomeRouter.swift
//  HomeRouter
//
//  Created by Filipe Oliveira on 07/10/21.
//

import Foundation
import UIKit

final class HomeRouter: NSObject, Router{
  var childRouters: [Router] = []
  private let presenter: UINavigationController
  private weak var navigationDelegate: RouterDelegate?
  
  // MARK: - Life Cycle
  
  init(presenter: UINavigationController,
       navigationDelegate: RouterDelegate? = nil) {
    self.presenter = presenter
    self.navigationDelegate = navigationDelegate
  }
  
  // MARK: - Functions
  
  func start() {
    
    let homeViewModel: HomeViewModel = HomeViewModel(service: HomeWorker(),
                                                     navigationDelegate: self)
    let homeViewController: HomeViewController = HomeViewController(viewModel: homeViewModel)
    
    let searchViewModel: SearchViewModel = SearchViewModel(service: SearchWorker(),
                                                           navigationDelegate: self)
    let searchViewController: SearchViewController = SearchViewController(viewModel: searchViewModel)
    
    let watchedViewModel: WatchedViewModel = WatchedViewModel(service: WatchedWorker(),
                                                              navigationDelegate: self)
    let watchedViewController: WatchedViewController = WatchedViewController(viewModel: watchedViewModel)
    
//    let profileViewModel: ProfileViewModel = ProfileViewModel(service: ProfileWorker(),
//                                                              navigationDelegate: self)
    let profileViewController: UIViewController = UIViewController()
    
    let tabbarController: UITabBarController = CustomTabBar()
    
    homeViewController.tabBarItem = .homeTabBarItem
    searchViewController.tabBarItem = .searchTabBarItem
    watchedViewController.tabBarItem = .watchedTabBarItem
    profileViewController.tabBarItem = .profileTabBarItem
    
    tabbarController.viewControllers = [homeViewController,
                                        searchViewController,
                                        watchedViewController,
                                        profileViewController]
    
    tabbarController.selectedViewController = homeViewController
    presenter.pushViewController(tabbarController, animated: true)
  }
}

//MARK: - HomeNavigationDelegate

extension HomeRouter: HomeNavigationDelegate {
  
}

//MARK: - SearchNavigationDelegate

extension HomeRouter: SearchNavigationDelegate {
  
}

//MARK: - WatchedNavigationDelegate

extension HomeRouter: WatchedNavigationDelegate {
  
}

//extension HomeRouter: ProfileNavigationDelegate {
//
//}
