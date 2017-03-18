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
    
    init(){
        let colors = BaseMessageCollectionViewCellDefaultStyle.Colors(incoming: UIColor.lightGray, outgoing: UIColor.blue)
        let style = BaseMessageCollectionViewCellDefaultStyle(colors: colors)
        super.init(baseStyle: style      )
        
    }
    
    override func textFont(viewModel: TextMessageViewModelProtocol, isSelected: Bool) -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
}
