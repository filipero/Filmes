//
//  SearchViewController.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

final class SearchViewController: UIViewController {
  private(set) lazy var baseView: SearchView = {
  	let view = SearchView()
  	return view
  }()

  let viewModel: SearchViewModelProtocol

  init(viewModel: SearchViewModelProtocol) {
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
    self.baseView.underConstructionImageView.image = self.viewModel.underConstructionImage
    self.baseView.underConstructionLabel.text = self.viewModel.underConstructionText
  }
}
