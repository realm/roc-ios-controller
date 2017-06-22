//
//  ROCTexMessageModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions

open class ROCTextMessageModel: TextMessageModel<ROCChatMessage> {
    
    public override init(messageModel: ROCChatMessage, text: String) {
        super.init(messageModel: messageModel, text: text)
    }
    
}
