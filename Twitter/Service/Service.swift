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
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()){
        let request: APIRequest <HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { ( homeDatasource ) in
            completion(homeDatasource, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}
