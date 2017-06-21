//
//  ConversationTableViewCell.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Kingfisher

class MinimalConversationTableViewCell: UITableViewCell {
    
    static let REUSE_ID = "MinimalConversationTableViewCell"
    static let HEIGHT: CGFloat = 80
    
    lazy var userImageView: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 60 / 2
        i.layer.masksToBounds = true
        i.layer.borderColor = UIColor.lightGray.cgColor
        i.layer.borderWidth = 1.0
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 16)
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var summaryLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var timeLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        return l
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(timeLabel)
        
        let views: [String: UIView] = [
            "userImageView": userImageView,
            "nameLabel": nameLabel,
            "summaryLabel": summaryLabel,
            "timeLabel": timeLabel
        ]
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[userImageView(60)]-8-[nameLabel]-8-[timeLabel]-16-|", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:[userImageView(60)]-8-[summaryLabel]-16-|", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[userImageView(60)]", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[nameLabel(25)]-8-[summaryLabel]-8-|", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[timeLabel(25)]", options: [], metrics: nil, views: views)
        )
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithConversation(conversation: MinimalConversation){
        if let imageUrl = conversation.imageUrl {
            let url = URL(string: imageUrl)
            userImageView.kf.setImage(with: url, options: [ .transition(.fade(0.2)) ])
        }
        nameLabel.text = conversation.displayName
        summaryLabel.text = conversation.summary
        timeLabel.text = conversation.friendlyTimestampString
    }
}
