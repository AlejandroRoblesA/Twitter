//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Alejandro on 9/18/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController{
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
