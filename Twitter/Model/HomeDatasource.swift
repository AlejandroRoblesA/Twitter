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
        return [alexUser, brianUser]
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
