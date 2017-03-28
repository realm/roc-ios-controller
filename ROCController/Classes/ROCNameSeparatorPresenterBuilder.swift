//
//  ROCNameSeparatorPresenterBuilder.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//


import UIKit
import Chatto

open class ROCNameSeparatorPresenterBuilder: ChatItemPresenterBuilderProtocol {
    
    public init(){
        
    }
    
    public func canHandleChatItem(_ chatItem: ChatItemProtocol) -> Bool {
        return chatItem is ROCNameSeparatorModel
    }
    
    public func createPresenterWithChatItem(_ chatItem: ChatItemProtocol) -> ChatItemPresenterProtocol {
        assert(self.canHandleChatItem(chatItem))
        return ROCNameSeparatorPresenter(model: chatItem as! ROCNameSeparatorModel)
    }
    
    public var presenterType: ChatItemPresenterProtocol.Type {
        return ROCNameSeparatorPresenter.self
    }
    
}
