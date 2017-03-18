//
//  ConversationTableViewCell.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Kingfisher

class ConversationTableViewCell: UITableViewCell {
    
    static let REUSE_ID = "ConversationTableViewCell"
    static let HEIGHT: CGFloat = 80
    
    lazy var userImageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
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
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[userImageView(40)]-8-[nameLabel]-8-[timeLabel]-16-|", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:[userImageView(40)]-8-[summaryLabel]-16-|", options: [], metrics: nil, views: views)
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[userImageView(40)]", options: [], metrics: nil, views: views)
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
    
    func setupWithConversation(conversation: Conversation){
        
    }
}
