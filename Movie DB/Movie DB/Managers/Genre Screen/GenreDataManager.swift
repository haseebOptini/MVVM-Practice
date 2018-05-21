//
//  GenreDataManager.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

protocol GenreDataProvider {
    var genreNetworkDataManager: GenreNetworkProvider { get set }
    var genreFactoryDataManager: GenreFactoryProvider { get set }
    func getGenres(onComplete: @escaping (([Genre]?, String, Bool)-> ()))
}

class GenreDataManager: GenreDataProvider {
    
    var  genreFactoryDataManager: GenreFactoryProvider
    var  genreNetworkDataManager: GenreNetworkProvider
    
    init(genreFactoryDataManager: GenreFactoryProvider = GenreFactory(), genreNetworkDataManager: GenreNetworkProvider = GenreNeworkManager()) {
        self.genreFactoryDataManager = genreFactoryDataManager
        self.genreNetworkDataManager = genreNetworkDataManager
    }
    
    
    func getGenres(onComplete: @escaping (([Genre]?, String, Bool)-> ())) {
        let genreUrlString = getGenresURL()
        print(genreUrlString)
        self.genreNetworkDataManager.getGenres(urlString: genreUrlString) { (genres: [[String: AnyObject]]?, message: String, success: Bool) -> () in
            if success {
                let genreBuilderResponse = self.genreFactoryDataManager.getGenres(withDictionaryArray: genres)
                onComplete(genreBuilderResponse.genres, genreBuilderResponse.message, genreBuilderResponse.success)
            } else {
                onComplete(nil, message, success)
            }
        }
    }

    fileprivate func getGenresURL() -> String {
        let urlString = "\(Url.base)\(Url.genreMovieList)?\(Url.APIKey)&\(Url.language)"
        return urlString
    }
}
