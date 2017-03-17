//
//  ROCController.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import UIKit
import Chatto
import ChattoAdditions
import RealmSwift

open class ROCBaseController<T: ROCBaseChatMessage>: BaseChatViewController {
    
    var dataSource: ROCDataSource<T>! {
        didSet {
            self.chatDataSource = self.dataSource
            self.dataSource.reload()
        }
    }
    let messageHandler = ROCBaseMessageHandler()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.reload()
        
    }
    
    open override func createChatInputView() -> UIView {
        return ROCInputView()
    }
    
    open override func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = ChatCollectionViewLayout()
        layout.delegate = self
        return layout
    }
    
    open override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        let textMessagePresenter = TextMessagePresenterBuilder(
            viewModelBuilder: ROCTextMessageViewModelBuilder(),
            interactionHandler: ROCTextMessageHandler(baseHandler: self.messageHandler)
        )
        return [
            "text/plain": [textMessagePresenter]
        ]
    }
    
}
