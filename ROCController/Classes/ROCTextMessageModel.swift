//
//  ROCTexMessageModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions

open class ROCTextMessageModel: TextMessageModel<MessageModel>, ROCMessageModelProtocol {
    public override init(messageModel: MessageModel, text: String) {
        super.init(messageModel: messageModel, text: text)
    }
    
    open var status: MessageStatus {
        get {
            return self._messageModel.status
        }
        set {
            self._messageModel.status = newValue
        }
    }
}
