//
//  HomeView.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

final class HomeView: BaseView {
  
  let popularMoviesCollectionViewBackground: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let popularMoviesCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 128, height: 88)
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.register(PopularMovieCollectionCellView.self,
                  forCellWithReuseIdentifier: PopularMovieCollectionCellView.identifier)
    view.showsHorizontalScrollIndicator = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  //MARK: - Initialize

  override func initialize() {
    backgroundColor = .white
    addSubview(popularMoviesCollectionViewBackground)
    popularMoviesCollectionViewBackground.addSubview(popularMoviesCollectionView)
  }
  
  //MARK: - Constraints

  override func installConstraints() {
    popularMoviesCollectionViewBackground.anchor(topAnchor: safeAreaLayoutGuide.topAnchor,
                                            leadingAnchor: safeAreaLayoutGuide.leadingAnchor,
                                            trailingAnchor: safeAreaLayoutGuide.trailingAnchor)
    
    popularMoviesCollectionViewBackground.heightAnchor.constraint(equalToConstant: 88).isActive = true
    
    popularMoviesCollectionView.anchor(topAnchor: popularMoviesCollectionViewBackground.topAnchor,
                                  leadingAnchor: popularMoviesCollectionViewBackground.leadingAnchor,
                                  trailingAnchor: popularMoviesCollectionViewBackground.trailingAnchor,
                                  bottomAnchor: popularMoviesCollectionViewBackground.bottomAnchor)
  }
}
