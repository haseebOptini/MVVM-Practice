//
//  Constants.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

struct ErrorMessages {
    static let serverSideError = "Server side error occurred"
    static let genreBuilderError = "Unable to create genre"
    static let errorTitle = "Error"
}

struct Titles {
    static let mapViewController = "Genre"
    static let moviesViewController = "Movies"
}

struct Url {
    static let base = "https://api.themoviedb.org/3"
    static let APIKey = "api_key=f5dbfbdaef51d55143aeb4cda010e69f"
    static let baseImageUrl = "http://image.tmdb.org/t/p/w185/"
    static let genreMovieList = "/genre/movie/list"
    static let genre = "/genre"
    static let movies = "/movies"
    static let language = "language=en-US"
    static let includeAdult = "include_adult=false"
    static let sortBy = "sort_by=created_at.asc"
}

struct Cells {
    static let genre = "genreCell"
    static let movie = "movieOverviewCell"
}

struct StoryBoard {
    static let main = "Main"
}

struct ViewController {
    static let movieList = "MovieList"
}
