//
//  NowPlayingTableCellView.swift
//  NowPlayingTableCellView
//
//  Created by Filipe Oliveira on 09/10/21.
//

import UIKit

final class NowPlayingTableCellView: UITableViewCell {
  static let identifier = "NowPlayingTableCellView"
  
  let titleLabel: UILabel = {
    let view = UILabel()
    view.font = .boldSystemFont(ofSize: 15)
    return view
  }()
  let movieRatingIcon: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(systemName: "star.fill")
    view.contentMode = .scaleAspectFit
    view.tintColor = .orange
    return view
  }()
  let movieRatingLabel: UILabel = {
    let view = UILabel()
    view.font = .boldSystemFont(ofSize: 12)
    view.textColor = .orange
    return view
  }()
  private lazy var ratingStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [movieRatingIcon,
                                              movieRatingLabel])
    view.spacing = 0
    view.axis = .horizontal
    return view
  }()
  let releaseDateLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 12)
    view.textColor = .gray
    return view
  }()
  private lazy var movieDetailsStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [titleLabel,
                                              ratingStackView,
                                              releaseDateLabel])
    view.spacing = 4
    view.axis = .vertical
    return view
  }()
  let movieBackdropImage: UIImageView = {
    let view = UIImageView()
    view.layer.masksToBounds = true
    view.layer.cornerRadius = 32
    view.backgroundColor = .gray.withAlphaComponent(0.3)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private lazy var mainStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [movieBackdropImage,
                                              movieDetailsStackView])
    view.spacing = 8
    view.axis = .horizontal
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let watchedButton: UIButton = {
    let view = UIButton()
    view.tintColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  //MARK: - Initialize
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupComponents() {
    selectionStyle = .none
    contentView.addSubview(mainStackView)
    contentView.addSubview(watchedButton)
    
    installConstraints()
  }
  
  private func installConstraints() {
    mainStackView.anchor(topAnchor: contentView.topAnchor, .medium,
                         leadingAnchor: contentView.leadingAnchor, .medium,
                         trailingAnchor: watchedButton.leadingAnchor, .medium,
                         bottomAnchor: contentView.bottomAnchor, .medium)
    
    movieBackdropImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
    movieBackdropImage.widthAnchor.constraint(equalToConstant: 64).isActive = true
    
    movieRatingIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
    
    watchedButton.anchor(topAnchor: contentView.topAnchor, .medium,
                       trailingAnchor: contentView.trailingAnchor, .medium)
    watchedButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
  }
}
