//
//  ROCTextMessageViewModelBuilder.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions

class ROCTextMessageViewModelBuilder: ViewModelBuilderProtocol {
    init() {}
    
    let messageViewModelBuilder = MessageViewModelDefaultBuilder()
    
    func createViewModel(_ textMessage: ROCTextMessageModel) -> ROCTextMessageViewModel {
        let messageViewModel = self.messageViewModelBuilder.createMessageViewModel(textMessage)
        let textMessageViewModel = ROCTextMessageViewModel(textMessage: textMessage, messageViewModel: messageViewModel)
        return textMessageViewModel
    }
    
    func canCreateViewModel(fromModel model: Any) -> Bool {
        return model is ROCTextMessageModel
    }
    
}
