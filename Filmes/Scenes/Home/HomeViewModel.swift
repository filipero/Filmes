//
//  HomeViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol HomeNavigationDelegate: AnyObject {
  
}

protocol HomeViewModelProtocol: AnyObject {
  var popularMoviesDataSource: CollectionViewDataSource<PopularMovieCollectionCellViewModel> { get }
  var popularMoviesState: Bindable<Bool> { get }
}

class HomeViewModel {
  private var service: HomeWorkerProtocol
  private weak var navigationDelegate: HomeNavigationDelegate?
  
  var popularMoviesDataSource: CollectionViewDataSource<PopularMovieCollectionCellViewModel> = .make(for: [])
  var popularMoviesState: Bindable<Bool> = Bindable()
  
  init(service: HomeWorkerProtocol = HomeWorker(),
       navigationDelegate: HomeNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
  }
}

//MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {
  public func requestMovieList() {
    service.requestPopularMovies(atPage: 1) { result in
      let popularMovies = result.results.map { result in
        PopularMovieCollectionCellViewModel(movieName: result.originalTitle, moviePosterUrl: result.posterPath)
      }
      self.popularMoviesDataSource = .make(for: popularMovies)
      self.popularMoviesState.update(with: true)
    }
  }
}

//MARK: - CollectionCellDataSource

fileprivate extension CollectionViewDataSource where Model == PopularMovieCollectionCellViewModel {
  static func make(for models: [PopularMovieCollectionCellViewModel],
                   reuseIdentifier: String = PopularMovieCollectionCellView.identifier) -> CollectionViewDataSource<Model> {
    return CollectionViewDataSource(models: models,
                                    reuseIdentifier: PopularMovieCollectionCellView.identifier,
                                    cellConfigurator: { (model, cell) in
      if let cell = cell as? PopularMovieCollectionCellView {
        model.configure(cell: cell)
      }
    })
  }
}
