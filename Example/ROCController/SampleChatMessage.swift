//
//  SampleChatMessage.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift
import ROCController

class SampleChatMessage: ROCBaseChatMessage {
    
    override var isIncoming: Bool {    
        return userId != "max"
    }
    
}
