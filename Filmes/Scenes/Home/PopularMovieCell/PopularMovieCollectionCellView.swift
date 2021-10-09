//
//  PopularMovieCollectionCellView.swift
//  PopularMovieCollectionCellView
//
//  Created by Filipe Oliveira on 08/10/21.
//

import Foundation
import UIKit

final class PopularMovieCollectionCellView: UICollectionViewCell {
  static let identifier = "PopularMovieCollectionCellView"
  
  let cardBackground: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let movieNameLabel: UILabel = {
    let view = UILabel()
    view.textColor = .gray
    view.font = .systemFont(ofSize: 12)
    view.adjustsFontSizeToFitWidth = true
    view.textAlignment = .center
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
    contentView.addSubview(cardBackground)
    contentView.addSubview(movieNameLabel)
    
    installConstraints()
  }
  
  private func installConstraints() {
    cardBackground.anchor(topAnchor: contentView.topAnchor,
                          leadingAnchor: contentView.leadingAnchor,
                          trailingAnchor: contentView.trailingAnchor)
    cardBackground.heightAnchor.constraint(equalToConstant: 64).isActive = true
    
    movieNameLabel.anchor(topAnchor: cardBackground.bottomAnchor,
                          leadingAnchor: contentView.leadingAnchor,
                          trailingAnchor: contentView.trailingAnchor,
                          bottomAnchor: contentView.bottomAnchor)
  }
}
