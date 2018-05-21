//
//  MovieListDataManager.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

protocol MovieListDataProvider {
    var movieListNetworkDataManager: MovieListNetworkProvider { get set }
    var movieListFactoryDataManager: MovieListFactoryProvider { get set }
    func getMovieList(genreId: Int, onComplete: @escaping (([Movie]?, String, Bool)-> ()))
}

class MovieListDataSource: MovieListDataProvider {
    var movieListNetworkDataManager: MovieListNetworkProvider
    var movieListFactoryDataManager: MovieListFactoryProvider
    
    init(movieListNetworkDataManager: MovieListNetworkProvider = MovieListNetworkManger(), movieListFactoryDataManager: MovieListFactoryProvider = MoviesFactory()) {
        self.movieListFactoryDataManager = movieListFactoryDataManager
        self.movieListNetworkDataManager = movieListNetworkDataManager
    }
    
    func getMovieList(genreId: Int, onComplete: @escaping (([Movie]?, String, Bool)-> ())) {
        let moviesListUrl = getGenresURL(genreId: genreId)
            self.movieListNetworkDataManager.getMovies(urlString: moviesListUrl) { (movies: [[String: AnyObject]]?, message: String, success: Bool) -> () in
            if success {
                let genreBuilderResponse = self.movieListFactoryDataManager.getMovies(withDictionaryArray: movies)
                onComplete(genreBuilderResponse.genres, genreBuilderResponse.message, genreBuilderResponse.success)
            } else {
                onComplete(nil, message, success)
            }
            
        }
    }
    
    fileprivate func getGenresURL(genreId: Int) -> String {
        let urlString = "\(Url.base)\(Url.genre)/\(genreId)\(Url.movies)?\(Url.APIKey)&\(Url.language)"
        return urlString
    }

}
