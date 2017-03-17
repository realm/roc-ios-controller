//
//  ROCTextMessageHandler.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions


class ROCTextMessageHandler: BaseMessageInteractionHandlerProtocol {
    private let baseHandler: ROCBaseMessageHandler
    init (baseHandler: ROCBaseMessageHandler) {
        self.baseHandler = baseHandler
    }
    
    func userDidTapOnFailIcon(viewModel: ROCTextMessageViewModel, failIconView: UIView) {
        self.baseHandler.userDidTapOnFailIcon(viewModel: viewModel)
    }
    
    func userDidTapOnAvatar(viewModel: ROCTextMessageViewModel) {
        self.baseHandler.userDidTapOnAvatar(viewModel: viewModel)
    }
    
    func userDidTapOnBubble(viewModel: ROCTextMessageViewModel) {
        self.baseHandler.userDidTapOnBubble(viewModel: viewModel)
    }
    
    func userDidBeginLongPressOnBubble(viewModel: ROCTextMessageViewModel) {
        self.baseHandler.userDidBeginLongPressOnBubble(viewModel: viewModel)
    }
    
    func userDidEndLongPressOnBubble(viewModel: ROCTextMessageViewModel) {
        self.baseHandler.userDidEndLongPressOnBubble(viewModel: viewModel)
    }
}
