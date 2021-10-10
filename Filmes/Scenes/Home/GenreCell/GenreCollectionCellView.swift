//
//  GenreCollectionCellView.swift
//  GenreCollectionCellView
//
//  Created by Filipe Oliveira on 09/10/21.
//

import UIKit

final class GenreCollectionCellView: UICollectionViewCell {
  static let identifier = "GenreCollectionCellView"
  
  let background: UIView = {
    let view = UIView()
    return view
  }()
  let coloredBackground: UIView = {
    let view = UIView()
    view.backgroundColor = .random()
    view.layer.cornerRadius = 8
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let genreName: UILabel = {
    let view = UILabel()
    view.textColor = .gray
    view.font = .systemFont(ofSize: 12)
    view.adjustsFontSizeToFitWidth = true
    view.textAlignment = .center
    return view
  }()
  lazy var mainStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [background,
                                              genreName])
    view.spacing = 0
    view.axis = .vertical
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  //MARK: - Initialize
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupComponents() {
    contentView.addSubview(mainStackView)
    background.addSubview(coloredBackground)
    installConstraints()
  }
  
  private func installConstraints() {
    mainStackView.anchor(to: contentView)
    coloredBackground.anchor(topAnchor: background.centerYAnchor,
                             leadingAnchor: background.leadingAnchor,
                             trailingAnchor: background.trailingAnchor,
                             bottomAnchor: background.bottomAnchor)
  }
}

