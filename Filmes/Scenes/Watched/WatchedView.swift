//
//  WatchedView.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

final class WatchedView: BaseView {
  let underConstructionImageView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleAspectFit
    view.tintColor = .yellow
    return view
  }()
  let underConstructionLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 18)
    view.textAlignment = .center
    return view
  }()
  private lazy var mainStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [underConstructionImageView,
                                              underConstructionLabel])
    view.distribution = .fillProportionally
    view.axis = .vertical
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  //MARK: - Initialize

  override func initialize() {
    backgroundColor = .white
    addSubview(mainStackView)
  }
  
  //MARK: - Constraints

  override func installConstraints() {
    mainStackView.anchor(topAnchor: safeAreaLayoutGuide.topAnchor, .huge,
                         leadingAnchor: safeAreaLayoutGuide.leadingAnchor, .huge,
                         trailingAnchor: safeAreaLayoutGuide.trailingAnchor, .huge,
                         bottomAnchor: safeAreaLayoutGuide.bottomAnchor, .huge)
  }
}
