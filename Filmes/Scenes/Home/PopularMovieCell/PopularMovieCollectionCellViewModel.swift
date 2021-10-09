//
//  PopularMovieTableCellViewModel.swift
//  PopularMovieTableCellViewModel
//
//  Created by Filipe Oliveira on 08/10/21.
//

import UIKit

struct PopularMovieCollectionCellViewModel {
  let movieName: String
  let moviePosterUrl: String
  
  func configure(cell: PopularMovieCollectionCellView) {
    cell.movieNameLabel.text = movieName
  }
}
