//
//  CollectionViewDataSource.swift
//  CollectionViewDataSource
//
//  Created by Filipe Oliveira on 08/10/21.
//

import UIKit

public class CollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
  public typealias CellConfigurator = (Model, UICollectionViewCell) -> Void

  public var models: [Model]
  public var sectionTitle: String? = nil
  private let reuseIdentifier: String
  private let cellConfigurator: CellConfigurator

  public init(models: [Model],
              reuseIdentifier: String,
              cellConfigurator: @escaping CellConfigurator) {
    self.models = models
    self.reuseIdentifier = reuseIdentifier
    self.cellConfigurator = cellConfigurator
  }

  public func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int {
    return models.count
  }

  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let model = models[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    cellConfigurator(model, cell)

    return cell
  }
}

public extension CollectionViewDataSource {
  func getModel(at indexPath: IndexPath) -> Model? {
    guard models.indices.contains(indexPath.row) else {
      return nil
    }
    return models[indexPath.row]
  }
}
