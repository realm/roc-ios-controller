//
//  ROCTextMessageCollectionViewCellStyle.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//


import UIKit
import Chatto
import ChattoAdditions

class ROCTextMessageCollectionViewCellStyle : TextMessageCollectionViewCellDefaultStyle {
    
    override func textFont(viewModel: TextMessageViewModelProtocol, isSelected: Bool) -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
}
