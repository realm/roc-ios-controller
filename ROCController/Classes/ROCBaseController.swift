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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.reload()
    }
    
}
