//
//  User.swift
//  Twitter
//
//  Created by Alejandro on 9/18/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User{
    let name: String
    let userName: String
    let bioText: String
    let profileImageUrl: String
    
    init (json: JSON){
        
        self.name = json["name"].stringValue
        self.userName = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
