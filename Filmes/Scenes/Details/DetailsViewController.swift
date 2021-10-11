//
//  detailsViewController.swift
//  Filmes
//
//  Created by Filipe Oliveira on 10/10/21.

import UIKit

final class DetailsViewController: UIViewController {
  private(set) lazy var baseView: DetailsView = {
  	let view = DetailsView()
  	return view
  }()

  let viewModel: DetailsViewModelProtocol

  init(viewModel: DetailsViewModelProtocol) {
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
