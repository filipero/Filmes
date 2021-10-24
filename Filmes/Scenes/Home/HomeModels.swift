//
//  HomeModels.swift
//  Filmes
//
//  Created by Filipe Oliveira on 07/10/21.

struct HomeModels {
  struct PopularMoviesResponse: Codable {
      let page: Int
      let results: [Result]
      let totalPages, totalResults: Int

      enum CodingKeys: String, CodingKey {
          case page, results
          case totalPages = "total_pages"
          case totalResults = "total_results"
      }
  }

  // MARK: - Result
  struct Result: Codable {
      let adult: Bool
      let backdropPath: String
      let genreIDS: [Int]
      let id: Int
      let originalLanguage: String
      let originalTitle, overview: String
      let popularity: Double
      let posterPath, releaseDate, title: String
      let video: Bool
      let voteAverage: Double
      let voteCount: Int

      enum CodingKeys: String, CodingKey {
          case adult
          case backdropPath = "backdrop_path"
          case genreIDS = "genre_ids"
          case id
          case originalLanguage = "original_language"
          case originalTitle = "original_title"
          case overview, popularity
          case posterPath = "poster_path"
          case releaseDate = "release_date"
          case title, video
          case voteAverage = "vote_average"
          case voteCount = "vote_count"
      }
  }
  
  struct Image: Codable {
      let images: Images
      let changeKeys: [String]

      enum CodingKeys: String, CodingKey {
          case images
          case changeKeys = "change_keys"
      }
  }

  // MARK: - Images
  struct Images: Codable {
      let baseURL: String
      let secureBaseURL: String
      let backdropSizes, logoSizes, posterSizes, profileSizes: [String]
      let stillSizes: [String]

      enum CodingKeys: String, CodingKey {
          case baseURL = "base_url"
          case secureBaseURL = "secure_base_url"
          case backdropSizes = "backdrop_sizes"
          case logoSizes = "logo_sizes"
          case posterSizes = "poster_sizes"
          case profileSizes = "profile_sizes"
          case stillSizes = "still_sizes"
      }
  }
  
  struct NowPlayingResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

  }
  struct Dates: Codable {
      let maximum, minimum: String
  }
  
  struct GenresResponse: Codable {
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
      case genres
    }
  }
  
  struct MovieData: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
  }
  
  struct Genre: Codable {
    let id: Int
    let name: String
  }
}
