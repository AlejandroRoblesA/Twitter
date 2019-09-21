//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Alejandro on 9/18/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    //where Iterator.Element == JSON, it means that you can only work with arrays 'JSON'
    func decode<T: JSONDecodable>()throws -> [T]{
        return try map {try T(json: $0)}
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        guard let usersJsonArray = json["users"].array,
              let tweetsJsonArray = json["tweets"].array  else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey : "Parsing JSON was not valid."])
        }
        
        self.users = try usersJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if (indexPath.section == 1){
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if (section == 1){
            return tweets.count
        }
        return users.count
    }
}
