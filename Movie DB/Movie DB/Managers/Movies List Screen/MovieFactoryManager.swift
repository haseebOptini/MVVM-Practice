//
//  MovieFactoryManager.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

protocol MovieListFactoryProvider {
    func getMovies(withDictionaryArray array:[[String: AnyObject]]? ) -> (success: Bool, message: String, genres: [Movie]?)
}

class MoviesFactory: MovieListFactoryProvider {
    
    func getMovies(withDictionaryArray array:[[String: AnyObject]]? ) -> (success: Bool, message: String, genres: [Movie]?) {
        if let movieArray = array, movieArray.count >= 1 {
            let movies = movieArray.flatMap{ (movieDict: [String: AnyObject]) -> [Movie] in
                [Movie(dictionary: movieDict)]
            }
            return(success: true, message: "", genres: movies)
        } else {
            return (false, ErrorMessages.genreBuilderError, nil)
        }
    }
    
}
