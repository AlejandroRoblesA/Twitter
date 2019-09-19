//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Alejandro on 9/18/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let alexUser = User(name: "Alejandro Robles", userName: "@AlejandroRoblesz", bioText: "Hello World!!! This is my twitter profile, I'm an iOS developer, this app is taken from let's build that app youtube channel", profileImage: UIImage(named: "ProfileImage")!)
        let brianUser = User(name: "Brian Voong", userName: "@buidthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: UIImage(named: "brian")!)
        
        let test = User(name: "Test", userName: "@test", bioText: "This app example is taken from let's buils that app youtube channel, to lern iOS development, and this app is re-written by myself on swift 5, you can follow me on twitter, my user twitter account is @AlejandroRoblesz, also I have a Github profile my user github account is @AlejandroRoblesA. Greetings", profileImage: UIImage(named: "ProfileImage")!)
        return [alexUser, brianUser, test]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
