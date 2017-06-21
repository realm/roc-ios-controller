//
//  RecipientTableViewCell.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class RecipientTableViewCell: UITableViewCell {
    
    static let REUSED_ID = "RecipientTableViewCell"
    static let HEIGHT: CGFloat = 80
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        let views: [String: Any] = [
            "nameLabel": nameLabel
        ]
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[nameLabel]-16-|", options: [], metrics: nil, views: views)
        )
        contentView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[nameLabel]-4-|", options: [], metrics: nil, views: views)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithUser(user: User){
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString
            .append(NSAttributedString(string: "\(user.name)\n", attributes: [
                NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)
                ]))
        
        mutableAttributedString
            .append(NSAttributedString(string: "\(user.email)", attributes: [
                NSFontAttributeName: UIFont.systemFont(ofSize: 16)
                ]))
        
        nameLabel.attributedText = mutableAttributedString
    }
    
    
}
