//
//  ROCNameSeparatorCollectionViewCell.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import UIKit
import Chatto

open class ROCNameSeparatorCollectionViewCell: UICollectionViewCell {
    
    private let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.label.font = UIFont.systemFont(ofSize: 12)
        self.label.textAlignment = .center
        self.label.textColor = UIColor.gray
        self.contentView.addSubview(label)
        backgroundColor = .red
        contentView.backgroundColor = .blue
    }
    
    
    open func setTextOnLabel(_ text: String, _ alignment: NSTextAlignment) {
        self.label.text = text
        self.label.textAlignment = alignment
        self.setNeedsLayout()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.contentView.frame
    }
}
