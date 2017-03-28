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

open class ROCBaseController<T: ROCBaseChatMessage>: BaseChatViewController, ROCInputViewDelegate {
    
    open var messageHandler = ROCBaseMessageHandler()
    
    public init(results: Results<T>){
        super.init(nibName: nil, bundle: nil)
        self.chatDataSource = ROCDataSource<T>(results: results)
        self.chatItemsDecorator = ROCDecorator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        (self.chatDataSource as! ROCDataSource<T>).observe()
    }
    
    open override func createChatInputView() -> UIView {
        let inputView = ROCInputView()
        inputView.delegate = self
        return inputView
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
        textMessagePresenter.textCellStyle = ROCTextMessageCollectionViewCellStyle()
        return [
            "text/plain": [textMessagePresenter],
            ROCTimeSeparatorModel.chatItemType: [ROCTimeSeparatorPresenterBuilder()]
        ]
    }
    

    open func sendButtonDidTap(text: String) {
    }
    
    open func attachmentButtonDidTapped() {
        
    }
}
