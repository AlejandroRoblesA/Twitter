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

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        
        var users = [User]()
        
        let array = json["users"].array
        for userJSON in array!{
            
            let name = userJSON["name"].stringValue
            let userName = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, userName: userName, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
    }
    
    let tweets: [Tweet] = {
        
        let alexUser = User(name: "Alejandro Robles", userName: "@AlejandroRoblesz", bioText: "Hello World!!! This is my twitter profile, I'm an iOS developer, this app is taken from let's build that app youtube channel", profileImage: UIImage(named: "ProfileImage")!)
        
        let tweet = Tweet(user: alexUser, message: "Hello Word!!. This is the first tweet example the app, rewritted by me on Swift 5, and this code is taken from letsbuidthatapp youtube channel. This tweet has to be longer more that Tweeter allows just to test the dynamic cell size, I think this is enough. Greeting")
        
        let tweetTwo = Tweet(user: alexUser, message: "Hello Word!!! Again, this is the second twett test, I think this tweet could be shorter that the fisrt")
        
        return [tweet, tweetTwo]
    }()
    
//    let users: [User] = {
//        let alexUser = User(name: "Alejandro Robles", userName: "@AlejandroRoblesz", bioText: "Hello World!!! This is my twitter profile, I'm an iOS developer, this app is taken from let's build that app youtube channel", profileImage: UIImage(named: "ProfileImage")!)
//        let brianUser = User(name: "Brian Voong", userName: "@buidthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: UIImage(named: "brian")!)
//        
//        let test = User(name: "Test", userName: "@test", bioText: "This app example is taken from let's buils that app youtube channel, to lern iOS development, and this app is re-written by myself on swift 5, you can follow me on twitter, my user twitter account is @AlejandroRoblesz, also I have a Github profile my user github account is @AlejandroRoblesA. Greetings", profileImage: UIImage(named: "ProfileImage")!)
//        return [alexUser, brianUser, test]
//    }()
    
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
