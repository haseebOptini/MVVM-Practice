//
//  Utility.swift
//  MyTaxiTest
//
//  Created by Abdul Haseeb on 8/12/17.
//  Copyright © 2017 Abdul Haseeb. All rights reserved.
//

import Foundation
import Alamofire

class Utility {
    /**
     This method is used to get string from the data response
     - Parameter response: this is the response that we got from server
     - Return data from response
     */
    
    class func data(fromResponse response: DataResponse<Any>) -> [String: AnyObject]? {
        guard let jsonResponse = response.result.value else {
            return nil
        }
        guard let dataDictionary = (jsonResponse as! [String: AnyObject])["placemarks"] as? [String : AnyObject]  else {
            return nil
        }
        return dataDictionary
    }
    
    class func errorMessage(from response: DataResponse<Any>) -> String? {
        let json = response.data.flatMap { (data: Data) -> [String : AnyObject]? in
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject] else {
                return nil
            }
            return json
        }
        return json?["message"] as? String
    }
    
    /**
     This method is used to get string from the data response
     - Parameter json: json from server
     - Return json in string
     */
    class func string(fromJson json: AnyObject) -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch _ {
            return nil
        }
    }

}
