//
//  ROCTimeseparatorPresenterBuilder.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import UIKit
import Chatto

open class ROCTimeSeparatorPresenterBuilder: ChatItemPresenterBuilderProtocol {
    
    public init(){
        
    }
    
    public func canHandleChatItem(_ chatItem: ChatItemProtocol) -> Bool {
        return chatItem is ROCTimeSeparatorModel
    }
    
    public func createPresenterWithChatItem(_ chatItem: ChatItemProtocol) -> ChatItemPresenterProtocol {
        assert(self.canHandleChatItem(chatItem))
        return ROCTimeSeparatorPresenter(model: chatItem as! ROCTimeSeparatorModel)
    }
    
    public var presenterType: ChatItemPresenterProtocol.Type {
        return ROCTimeSeparatorPresenter.self
    }
    
}
