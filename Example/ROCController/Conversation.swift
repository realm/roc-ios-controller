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
    
    dynamic var conversationId: String = UUID().uuidString
    dynamic var timestamp: Date = Date()
    dynamic var summary: String = ""
    dynamic var displayName: String = ""
    dynamic var imageUrl: String? = nil
    
    let chatMessages = List<SampleChatMessage>()
    
    override static func primaryKey() -> String? {
        return "conversationId"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["friendlyTimestampString"]
    }
    
    var friendlyTimestampString: String {
        let dateFormatter = DateFormatter()
    
        if NSCalendar.current.isDateInToday(timestamp){
            dateFormatter.dateFormat = ""
        } else if NSCalendar.current.isDateInYesterday(timestamp) {
            return "Yesterday"
        } else {
            dateFormatter.dateFormat = "MM/dd"
        }
        return dateFormatter.string(from: timestamp)
    }
    
}
