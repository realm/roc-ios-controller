//
//  Conversation.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift

class Conversation: Object {
    
    let chatMessages = List<SampleChatMessage>()
    
}
