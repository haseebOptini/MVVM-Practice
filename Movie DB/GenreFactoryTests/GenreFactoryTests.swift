//
//  GenreFactoryTests.swift
//  GenreFactoryTests
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import XCTest
@testable import Movie_DB

class GenreFactoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGenreFactroyWithNil() {
        let genreFactory = GenreFactory()
        let genres = [["id": 28,
            "name": "Action"],[
            "id": 12,
            "name": "Adventure"
            ]]
        let result = genreFactory.getGenres(withDictionaryArray: genres as [[String : AnyObject]])
        let genresArray = result.genres
        XCTAssertEqual(genres.count, genresArray?.count)
    }
}
