//
//  Service.swift
//  Twitter
//
//  Created by Alejandro on 9/20/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service{
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()){
        let request: APIRequest <HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { ( homeDatasource ) in
            print("Successfully fetched our JSON objects")
            completion(homeDatasource)
//            self.datasource = homeDatasource
        }) { (error) in
            print("Failed to fetch JSON", error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}
