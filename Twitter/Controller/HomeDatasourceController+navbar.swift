//
//  HomeDatasourceController+navbar.swift
//  Twitter
//
//  Created by Alejandro on 9/19/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import UIKit

extension HomeDatasourceController{
    
    func setupNavigationBarItems(){
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems(){
        
        let titleImageView = UIImageView(image: UIImage(named: "title_icon"))
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupLeftNavItem(){
        let followButton = UIButton(type: .system)
        followButton.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        followButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems(){
        let searchButton  = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.contentMode = .scaleAspectFit
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.translatesAutoresizingMaskIntoConstraints = false
        composeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        composeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        composeButton.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
