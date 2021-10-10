//
//  detailsViewController.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import UIKit

final class detailsViewController: UIViewController {
  private(set) lazy var baseView: detailsView = {
  	let view = detailsView()
  	return view
  }()

  let viewModel: detailsViewModelProtocol

  init(viewModel: detailsViewModelProtocol) {
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
