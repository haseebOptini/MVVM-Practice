//
//  IntegrationTest.swift
//  MyTaxiTest
//
//  Created by Abdul Haseeb on 9/30/17.
//  Copyright © 2017 Abdul Haseeb. All rights reserved.
//

import XCTest
@testable import Movie_DB

class IntegrationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let mocData = MocNetworkManager()
        let genreDataManager = GenreDataManager(genreFactoryDataManager: GenreFactory(), genreNetworkDataManager: mocData)
        genreDataManager.getGenres(onComplete: { (cars: [Genre]?, message: String, success: Bool) -> () in
                        XCTAssert(success)
                        XCTAssertNotNil(cars)
                        XCTAssertEqual(message, "")
        })
    }
    
        
}
