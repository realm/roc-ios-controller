//
//  ROCDataSource.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import Chatto
import Realm
import RealmSwift

open class ROCDataSource<T: ROCBaseChatMessage>: ChatDataSourceProtocol {
    
    open var chatItems: [ChatItemProtocol] =  []
    open var hasMorePrevious: Bool = false
    open var hasMoreNext: Bool = false
    open var delegate: ChatDataSourceDelegateProtocol?
    open func loadNext() {
        
    }
    open func loadPrevious() {
        
    }
    open func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: ((Bool)) -> Void) {
        
    }
    
    
    private var _token: NotificationToken?
    public var results: Results<T> {
        return _results
    }
    private var _results: Results<T>
    
    public init(results: Results<T>){
        self._results = results
    }
    
    public func observe(){
        self._token?.stop()
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
        self._token = self._results.addNotificationBlock({ [weak self] (changes) in
            guard let `self` = self else { return }
            var chatItems = [ChatItemProtocol]()
            for r in self.results {
                let copy = T(value: r, schema: RLMSchema.partialShared())
                let textMessageModel = ROCTextMessageModel(messageModel: copy, text: copy.text)
                chatItems.append(textMessageModel)
            }
            self.chatItems = chatItems
            self.delegate?.chatDataSourceDidUpdate(self)
        })
    }
    
    public func reload(){
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
    }
    
    public func stop(){
        _token?.stop()
    }
    
    deinit {
        _token?.stop()
    }
}
