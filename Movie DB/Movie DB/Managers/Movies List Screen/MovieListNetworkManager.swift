//
//  MovieListNetworkManager.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieListNetworkProvider {
    func getMovies(urlString: String, onCompletion: @escaping (([[String: AnyObject]]?, String, Bool) -> ()))
}

class MovieListNetworkManger:  MovieListNetworkProvider{
    func getMovies(urlString: String, onCompletion: @escaping (([[String: AnyObject]]?, String, Bool) -> ())) {
        Alamofire.request(urlString,
                          method: .get).validate().responseJSON {
                            [weak self] (response: DataResponse<Any>) in
                            guard self != nil else {
                                return
                            }
                            
                            switch response.result {
                            case .success:
                                guard let jsonResponse = response.result.value else {
                                    onCompletion(nil, ErrorMessages.serverSideError, false)
                                    return
                                }
                                let jsonString = Utility.string(fromJson: jsonResponse as AnyObject)
                                print(jsonString!)
                                
                                guard let placeMarks = (jsonResponse as! [String: AnyObject])["results"] as? [[String : AnyObject]]  else {
                                    onCompletion(nil, ErrorMessages.serverSideError, false)
                                    return
                                }
                                onCompletion(placeMarks,"",true)
                            case .failure(let error):
                                print(error.localizedDescription)
                                break
                            }
        }
    }
}
