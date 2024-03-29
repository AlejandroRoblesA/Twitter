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
    
    let errorMessageLabel: UILabel = {
       let label = UILabel()
        label.text = "Apologies something went wrong. Please try again latter..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //This methos is used to correctly landscape view
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() //LBTA method
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, error) in
            if let error = error {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = error as? APIError<Service.JSONError>{
                    if apiError.response?.statusCode != 200{
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                return
            }
            self.datasource = homeDatasource
        }
        
//        Service.sharedInstance.fetchHomeFeed { (homeDatasource) in
//            self.datasource = homeDatasource
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.section == 0){
            
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero}
            
            let estimatedHeight = estimatedHeightForText(user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
        }
        else if (indexPath.section == 1){
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat{
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
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
