//
//  Tweet.swift
//  Twitter
//
//  Created by Alejandro on 9/19/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet{
    let user: User
    let message: String
    
    init(json: JSON) {
        
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
