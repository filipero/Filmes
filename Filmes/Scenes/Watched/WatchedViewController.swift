//
//  WatchedViewController.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

final class WatchedViewController: UIViewController {
  private(set) lazy var baseView: WatchedView = {
  	let view = WatchedView()
  	return view
  }()

  let viewModel: WatchedViewModelProtocol

  init(viewModel: WatchedViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: .main)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Life Cycle

  override func loadView() {
    super.loadView()

    view = baseView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBinds()
  }

  private func setupBinds() {
  
  }
}
