//
//  Tweet.swift
//  Twitter
//
//  Created by Alejandro on 9/19/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable{
    let user: User
    let message: String
    
    init(json: JSON) {
        
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
