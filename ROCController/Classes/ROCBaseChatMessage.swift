//
//  BaseChatMessage.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import RealmSwift
import Chatto

open class ROCBaseChatMessage: Object {
    
    public dynamic var chatMessageId: String = UUID().uuidString
    public dynamic var timestamp: NSDate = NSDate()
    public dynamic var userId: String = UUID().uuidString
    
    public dynamic var text: String = ""
    public dynamic var mimeType: String = "text/plain"
    public dynamic var extraData: NSData? = nil
    
    override open static func primaryKey() -> String? {
        return "chatMessageId"
    }
    
    override open static func indexedProperties() -> [String] {
        return ["timestamp"]
    }

}
