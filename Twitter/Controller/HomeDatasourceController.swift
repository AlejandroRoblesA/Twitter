//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Alejandro on 9/18/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController{
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class Home: JSONDecodable{
        
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
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //This methos is used to correctly landscape view
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource

        fetchHomeFeed()
    }
    
    fileprivate func fetchHomeFeed(){
        
        let request: APIRequest <HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        //request("/twitter/home", responseSerializer: responseSerializer)
        request.perform(withSuccess: { ( homeDatasource ) in
            print("Successfully fetched our JSON objects")
            
            self.datasource = homeDatasource
        }) { (error) in
            print("Failed to fetch JSON", error)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User{
            
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if (section == 1){
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 1){
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
