//
//  NowPlayingTableCellViewModel.swift
//  NowPlayingTableCellViewModel
//
//  Created by Filipe Oliveira on 09/10/21.
//

import Foundation

struct NowPlayingTableCellViewModel {
  let movieName: String
  let movieRating: String
  let moviePosterUrl: String
  let releaseDate: String
  
  func configure(cell: NowPlayingTableCellView) {
    cell.titleLabel.text = movieName
    cell.movieRatingLabel.text = movieRating
    cell.releaseDateLabel.text = releaseDate
    cell.movieIcon.downloaded(from: moviePosterUrl, contentMode: .scaleToFill)
  }
}
