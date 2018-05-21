//
//  MocData.swift
//  MyTaxiTest
//
//  Created by Abdul Haseeb on 9/30/17.
//  Copyright © 2017 Abdul Haseeb. All rights reserved.
//

import Foundation
@testable import Movie_DB

class MocNetworkManager: GenreNetworkProvider {
    
    func getGenres(urlString: String, onCompletion: @escaping (([[String: AnyObject]]?, String, Bool) -> ())) {
        guard let filePath = Bundle.main.path(forResource: "carsData", ofType: "json") else {
            return
        }
        guard let fileContent = NSDictionary(contentsOfFile: filePath) as? [String: AnyObject] else {
            return
        }
        
        guard let placeMarks = fileContent["genres"] as? [[String : AnyObject]]  else {
            onCompletion(nil, ErrorMessages.serverSideError, false)
            return
        }
        onCompletion(placeMarks,"",true)
    }
    
   
}
