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
import ChattoAdditions

open class ROCBaseChatMessage: Object {
    
    public dynamic var chatMessageId: String = UUID().uuidString
    public dynamic var timestamp: Date = Date()
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

extension ROCBaseChatMessage: ROCMessageModelProtocol {
    
    public var uid: String {
        return chatMessageId
    }
    
    public var type: ChatItemType {
        return mimeType
    }
    
    public var date: Date {
        return timestamp as Date
    }
    
    public var senderId: String {
        return userId
    }
    
    open var isIncoming : Bool {
        return true
    }
    
    // Realm will aggressively try to send it over, this is out of our control
    public var status: MessageStatus {
        get {
            return .success
        }
        set {
            
        }
    }
    
}
