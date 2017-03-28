//
//  ROCTextMessageViewModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions

public class ROCTextMessageViewModel: TextMessageViewModel<ROCTextMessageModel>, ROCMessageViewModelProtocol {
    
    override init(textMessage: ROCTextMessageModel, messageViewModel: MessageViewModelProtocol) {
        super.init(textMessage: textMessage, messageViewModel: messageViewModel)
    }
    
    public var messageModel: ROCMessageModelProtocol {
        return self.textMessage as! ROCMessageModelProtocol
    }
    
}
