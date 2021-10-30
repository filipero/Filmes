//
//  NowPlayingTableCellViewModel.swift
//  NowPlayingTableCellViewModel
//
//  Created by Filipe Oliveira on 09/10/21.
//

import Foundation
import UIKit

protocol WatchedButtonDelegate {
  func watchedButtonTapped(movieId: Int)
}

class NowPlayingTableCellViewModel {
  let movieId: Int
  let movieName: String
  let movieRating: String
  let moviePosterUrl: String
  let releaseDate: String
  var watched: Bool = false
  var delegate: WatchedButtonDelegate?
  
  init(movieId: Int,
       movieName: String,
       movieRating: String,
       moviePosterUrl: String,
       releaseDate: String,
       watched: Bool = false,
       delegate: WatchedButtonDelegate? = nil) {
    self.movieId = movieId
    self.movieName = movieName
    self.movieRating = movieRating
    self.moviePosterUrl = moviePosterUrl
    self.releaseDate = releaseDate
    self.watched = watched
    self.delegate = delegate
  }
  
  func configure(cell: NowPlayingTableCellView) {
    cell.titleLabel.text = movieName
    cell.movieRatingLabel.text = movieRating
    cell.releaseDateLabel.text = releaseDate
    cell.movieBackdropImage.downloaded(from: moviePosterUrl, contentMode: .scaleToFill)
    if watched {
      cell.watchedButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    } else {
      cell.watchedButton.setImage(UIImage(systemName: "eye"), for: .normal)
    }
    cell.watchedButton.removeTarget(nil, action: nil, for: .allEvents)
    cell.watchedButton.addTarget(self,
                                 action: #selector(didTapWatchedButton),
                                 for: .touchUpInside)
  }
}

extension NowPlayingTableCellViewModel {
  @objc func didTapWatchedButton() {
    self.delegate?.watchedButtonTapped(movieId: self.movieId)
  }
}
