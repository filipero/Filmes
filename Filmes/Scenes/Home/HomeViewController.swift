//
//  HomeViewController.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import UIKit

final class HomeViewController: UIViewController {
  private(set) lazy var baseView: HomeView = {
    let view = HomeView()
    return view
  }()
  
  let viewModel: HomeViewModelProtocol
  
  init(viewModel: HomeViewModelProtocol) {
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
    viewModel.popularMoviesState.addObservation(for: self) { _,_ in
      self.baseView.popularMoviesCollectionView.dataSource = self.viewModel.popularMoviesDataSource
      self.baseView.popularMoviesCollectionView.delegate = self
      self.baseView.popularMoviesCollectionView.reloadData()
    }
    
    viewModel.nowPlayingState.addObservation(for: self) { _,_ in
      self.baseView.nowPlayingTableView.dataSource = self.viewModel.nowPlayingDataSource
      self.baseView.nowPlayingTableView.delegate = self
      self.baseView.nowPlayingTableView.reloadData()
    }
    
    viewModel.genreState.addObservation(for: self) { _,_ in
      self.baseView.genreCollectionView.dataSource = self.viewModel.genreDataSource
      self.baseView.genreCollectionView.reloadData()
    }
  }
}

extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch collectionView {
    case self.baseView.popularMoviesCollectionView:
      guard let selectedModel: PopularMovieCollectionCellViewModel = self.viewModel.popularMoviesDataSource.getModel(at: indexPath) else { return }
      self.viewModel.goToMovieDetails(movieId: selectedModel.movieId)
    case self.baseView.genreCollectionView:
      guard let selectedModel: GenreCollectionCellViewModel = self.viewModel.genreDataSource.getModel(at: indexPath) else { return }
      let genre = HomeModels.Genre(id: selectedModel.id,
                                   name: selectedModel.name)
      self.viewModel.goToMovieList(withGenre: genre)
    default:
      break
    }
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.baseView.nowPlayingTableView {
      guard let selectedModel: NowPlayingTableCellViewModel = self.viewModel.nowPlayingDataSource.getModel(at: indexPath) else { return }
      self.viewModel.goToMovieDetails(movieId: selectedModel.movieId)
    }
  }
}
