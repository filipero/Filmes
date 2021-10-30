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
    layout.minimumInteritemSpacing = 32
    layout.itemSize = CGSize(width: 128, height: 88)
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.backgroundColor = .systemBackground
    view.register(PopularMovieCollectionCellView.self,
                  forCellWithReuseIdentifier: PopularMovieCollectionCellView.identifier)
    view.showsHorizontalScrollIndicator = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let nowPlayingBackground: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let MoviesLabel: UILabel = {
    let view = UILabel()
    view.font = .boldSystemFont(ofSize: 15)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let nowPlayingTableView: UITableView = {
    let view = UITableView()
    view.separatorStyle = .none
    view.backgroundColor = .systemBackground
    view.register(NowPlayingTableCellView.self,
                  forCellReuseIdentifier: NowPlayingTableCellView.identifier)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let genreCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 32
    layout.itemSize = CGSize(width: 128, height: 88)
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.backgroundColor = .systemBackground
    view.register(GenreCollectionCellView.self,
                  forCellWithReuseIdentifier: GenreCollectionCellView.identifier)
    view.showsHorizontalScrollIndicator = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  //MARK: - Initialize

  override func initialize() {
    backgroundColor = .systemBackground
    addSubview(genreCollectionView)
    addSubview(popularMoviesCollectionView)
    addSubview(nowPlayingBackground)
    nowPlayingBackground.addSubview(MoviesLabel)
    nowPlayingBackground.addSubview(nowPlayingTableView)
  }
  
  //MARK: - Constraints

  override func installConstraints() {
    genreCollectionView.anchor(topAnchor: safeAreaLayoutGuide.topAnchor,
                               leadingAnchor: safeAreaLayoutGuide.leadingAnchor, .medium,
                               trailingAnchor: safeAreaLayoutGuide.trailingAnchor, .medium)
    genreCollectionView.heightAnchor.constraint(equalToConstant: 88).isActive = true
    
    popularMoviesCollectionView.anchor(topAnchor: genreCollectionView.bottomAnchor, .large,
                                       leadingAnchor: safeAreaLayoutGuide.leadingAnchor, .medium,
                                       trailingAnchor: safeAreaLayoutGuide.trailingAnchor, .medium)
    popularMoviesCollectionView.heightAnchor.constraint(equalToConstant: 88).isActive = true
    
    nowPlayingBackground.anchor(topAnchor: popularMoviesCollectionView.bottomAnchor, .large,
                                leadingAnchor: leadingAnchor, .medium,
                                trailingAnchor: trailingAnchor, .medium,
                                bottomAnchor: bottomAnchor)
    
    nowPlayingTableView.anchor(to: nowPlayingBackground, yPadding: .huge)
  }
}
