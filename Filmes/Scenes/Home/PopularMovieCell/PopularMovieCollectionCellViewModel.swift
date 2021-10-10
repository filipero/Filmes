//
//  PopularMovieTableCellViewModel.swift
//  PopularMovieTableCellViewModel
//
//  Created by Filipe Oliveira on 08/10/21.
//

import UIKit

struct PopularMovieCollectionCellViewModel {
  let movieId: Int
  let title: String
  let moviePosterUrl: String
  
  func configure(cell: PopularMovieCollectionCellView) {
    cell.movieNameLabel.text = title
    cell.backgroundImage.downloaded(from: moviePosterUrl, contentMode: .scaleToFill)
  }
}
