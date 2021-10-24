//
//  HomeViewModel.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

import Foundation

protocol HomeNavigationDelegate: AnyObject {
  func goToMovieDetails(movieId: Int)
  func goToMovieList(withGenre genre: HomeModels.Genre)
}

protocol HomeViewModelProtocol: AnyObject {
  var popularMoviesDataSource: CollectionViewDataSource<PopularMovieCollectionCellViewModel> { get }
  var popularMoviesState: Bindable<Void> { get }
  var nowPlayingDataSource: TableViewDataSource<NowPlayingTableCellViewModel> { get }
  var nowPlayingState: Bindable<Void> { get }
  var genreDataSource: CollectionViewDataSource<GenreCollectionCellViewModel> { get }
  var genreState: Bindable<Void> { get }
  var nowPlayingLabelText: String { get }
  
  func goToMovieDetails(movieId: Int)
  func goToMovieList(withGenre genre: HomeModels.Genre)
}

class HomeViewModel {
  private var service: HomeWorkerProtocol
  private weak var navigationDelegate: HomeNavigationDelegate?
  
  var popularMoviesDataSource: CollectionViewDataSource<PopularMovieCollectionCellViewModel> = .make(for: [])
  var popularMoviesState: Bindable<Void> = Bindable()
  
  var nowPlayingDataSource: TableViewDataSource<NowPlayingTableCellViewModel> = .make(for: [])
  var nowPlayingState: Bindable<Void> = Bindable()
  
  var genreDataSource: CollectionViewDataSource<GenreCollectionCellViewModel> = .make(for: [])
  var genreState: Bindable<Void> = Bindable()
  
  var nowPlayingLabelText: String = "Em Cartaz"
  
  init(service: HomeWorkerProtocol = HomeWorker(),
       navigationDelegate: HomeNavigationDelegate? = nil) {
    self.service = service
    self.navigationDelegate = navigationDelegate
    requestConfiguration()
  }
}

//MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {
  public func requestConfiguration() {
    service.requestConfiguration {
      self.requestPopularMoviesList(atPage: 1)
      self.requestNowPlayingMovies(atPage: 1)
      self.requestGenres()
    }
  }
  public func requestPopularMoviesList(atPage page: Int,
                                       session: SessionCore = SessionCore.shared) {
    service.requestPopularMovies(atPage: page) { result in
      let baseUrl = session.session.imageSecureBaseUrl
      let popularMovies: [PopularMovieCollectionCellViewModel] = result.results.map {
        PopularMovieCollectionCellViewModel(movieId: $0.id,
                                            title: $0.title,
                                            moviePosterUrl: baseUrl + "w300" + $0.backdropPath)
      }
      if !popularMovies.isEmpty {
        self.popularMoviesDataSource = .make(for: popularMovies)
        self.popularMoviesState.update(with: ())
      }
    }
  }
  
  public func requestNowPlayingMovies(atPage page: Int,
                                      session: SessionCore = SessionCore.shared) {
    service.requestNowPlayingMovies(atPage: 1) { result in
      let baseUrl = session.session.imageSecureBaseUrl
      let nowPlayingMovies: [NowPlayingTableCellViewModel] = result.results.map {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd"
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "dd/MM/yyyy"
        var formattedDate: String = $0.releaseDate
        if let date = dateFormatterInput.date(from: $0.releaseDate) {
          formattedDate = dateFormatterOutput.string(from: date)
        }
        return NowPlayingTableCellViewModel(movieId: $0.id,
                                     movieName: $0.title,
                                     movieRating: "\($0.voteAverage)",
                                     moviePosterUrl: baseUrl + "w300" + $0.backdropPath,
                                     releaseDate: formattedDate)
      }
      if !nowPlayingMovies.isEmpty {
        self.nowPlayingDataSource = .make(for: nowPlayingMovies)
        self.nowPlayingState.update(with: ())
      }
    }
  }
  
  public func requestGenres() {
    service.requestMovieGenres {
      let genreList: [GenreCollectionCellViewModel] = $0.genres.map {
        GenreCollectionCellViewModel(id: $0.id,
                                     name: $0.name)
      }
      if !genreList.isEmpty {
        self.genreDataSource = .make(for: genreList)
        self.genreState.update(with: ())
      }
    }
  }
  
  public func goToMovieDetails(movieId: Int) {
    navigationDelegate?.goToMovieDetails(movieId: movieId)
  }
  
  public func goToMovieList(withGenre genre: HomeModels.Genre) {
    navigationDelegate?.goToMovieList(withGenre: genre)
  }
}

//MARK: - PopularMovieCollectionCellDataSource

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

//MARK: - GenreCollectionCellDataSource

fileprivate extension CollectionViewDataSource where Model == GenreCollectionCellViewModel {
  static func make(for models: [GenreCollectionCellViewModel],
                   reuseIdentifier: String = GenreCollectionCellView.identifier) -> CollectionViewDataSource<Model> {
    return CollectionViewDataSource(models: models,
                                    reuseIdentifier: GenreCollectionCellView.identifier,
                                    cellConfigurator: { (model, cell) in
      if let cell = cell as? GenreCollectionCellView {
        model.configure(cell: cell)
      }
    })
  }
}

//MARK: - NowPlayingTableViewDataSource

fileprivate extension TableViewDataSource where Model == NowPlayingTableCellViewModel {
  static func make(for models: [NowPlayingTableCellViewModel],
                   reuseIdentifier: String = NowPlayingTableCellView.identifier) -> TableViewDataSource<Model> {
    return TableViewDataSource(models: models,
                                    reuseIdentifier: NowPlayingTableCellView.identifier,
                                    cellConfigurator: { (model, cell) in
      if let cell = cell as? NowPlayingTableCellView {
        model.configure(cell: cell)
      }
    })
  }
}
