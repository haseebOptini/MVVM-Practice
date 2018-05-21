//
//  GenreFactoryManager.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

protocol GenreFactoryProvider {
    func getGenres(withDictionaryArray array:[[String: AnyObject]]? ) -> (success: Bool, message: String, genres: [Genre]?)
}

class GenreFactory: GenreFactoryProvider {
    
    func getGenres(withDictionaryArray array:[[String: AnyObject]]? ) -> (success: Bool, message: String, genres: [Genre]?) {
        if let array = array, array.count >= 1 {
            let genres = array.flatMap{ (genreDict: [String: AnyObject]) -> [Genre] in
                [Genre(dictionary: genreDict)]
            }
            return(success: true, message: "", genres: genres)
        } else {
            return (false, ErrorMessages.genreBuilderError, nil)
        }
    }
    
}
