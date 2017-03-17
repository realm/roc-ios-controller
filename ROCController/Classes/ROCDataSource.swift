//
//  ROCDataSource.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import Chatto
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
    
    open var token: NotificationToken?
    private var isFirstLoad: Bool = true
    
    open var results: Results<T>? {
        didSet {
            self.token?.stop()
            self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
            self.isFirstLoad = true
            self.results?.addNotificationBlock({ [weak self] (changes) in
                guard let `self` = self else { return }
                
            })
        }
    }
    
    public func reload(){
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
    }
    
    deinit {
        token?.stop()
    }
}
