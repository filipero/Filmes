//
//  GenreCollectionCellViewModel.swift
//  GenreCollectionCellViewModel
//
//  Created by Filipe Oliveira on 09/10/21.
//

import UIKit

struct GenreCollectionCellViewModel {
  let id: Int
  let name: String
  
  func configure(cell: GenreCollectionCellView) {
    cell.genreName.text = name
  }
}

