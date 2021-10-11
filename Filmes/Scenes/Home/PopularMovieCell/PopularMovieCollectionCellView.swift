//
//  PopularMovieCollectionCellView.swift
//  PopularMovieCollectionCellView
//
//  Created by Filipe Oliveira on 08/10/21.
//

import UIKit

final class PopularMovieCollectionCellView: UICollectionViewCell {
  static let identifier = "PopularMovieCollectionCellView"
  let backdropImageView: UIImageView = {
    let view = UIImageView()
    view.layer.cornerRadius = 8
    view.layer.masksToBounds = true
    view.backgroundColor = .gray.withAlphaComponent(0.3)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let movieNameLabel: UILabel = {
    let view = UILabel()
    view.textColor = .gray
    view.adjustsFontSizeToFitWidth = true
    view.textAlignment = .center
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var mainStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [backdropImageView,
                                              movieNameLabel])
    view.spacing = 4
    view.axis = .vertical
    view.distribution = .fillProportionally
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
    
    installConstraints()
  }
  
  private func installConstraints() {
    mainStackView.anchor(to: contentView)
    movieNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
  }
}
