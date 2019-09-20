//
//  TweetCell.swift
//  Twitter
//
//  Created by Alejandro on 9/19/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let tweet = datasourceItem as? Tweet else { return }
            messageTextView.text = tweet.message
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "  \(tweet.user.userName)\n"
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Some sample text"
        return textView
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProfileImage")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
