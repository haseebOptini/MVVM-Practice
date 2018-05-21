//
//  Movie.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

class Movie {
    struct Keys {
        static let id = "id"
        static let title = "title"
        static let adult = "adult"
        static let backdropPath = "backdrop_path"
        static let originalTitle = "original_title"
        static let overview = "overview"
        static let releaseDate = "release_date"
        static let posterPath = "poster_path"
        static let popularity = "popularity"
        static let voteCount = "vote_count"
        static let genreId = "genre_ids"
        static let voteAverage = "vote_average"
    }
    let id: Int
    let title: String
    let adult: Bool
    let backdropPath: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Float
    let popularity: Float
    
    init(dictionary: [String: AnyObject]) {
        id = dictionary[Keys.id] as? Int ?? 0
        title = dictionary[Keys.title] as? String ?? ""
        adult = dictionary[Keys.adult] as? Bool ?? false
        backdropPath = dictionary[Keys.backdropPath] as? String ?? ""
        originalTitle = dictionary[Keys.originalTitle] as? String ?? ""
        overview = dictionary[Keys.overview] as? String ?? ""
        releaseDate = dictionary[Keys.releaseDate] as? String ?? ""
        posterPath = dictionary[Keys.posterPath] as? String ?? ""
        voteAverage = dictionary[Keys.voteAverage] as? Float ?? 0
        popularity = dictionary[Keys.popularity] as? Float ?? 0
     }
}
