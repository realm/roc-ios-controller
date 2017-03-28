//
//  ROCTimeSeperatorModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import Foundation
import UIKit
import Chatto

open class ROCTimeSeparatorModel: ChatItemProtocol {
    
    public let uid: String
    public let type: String = ROCTimeSeparatorModel.chatItemType
    public let date: String
    
    public static var chatItemType: ChatItemType {
        return "ROCTimeSeparatorModel"
    }
    
    public init(uid: String, date: String) {
        self.date = date
        self.uid = uid
    }
}

extension Date {
    // Have a time stamp formatter to avoid keep creating new ones. This improves performance
    private static let weekdayAndDateStampDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "EEEE, MMM dd yyyy" // "Monday, Mar 7 2016"
        return dateFormatter
    }()
    
    public func toWeekDayAndDateString() -> String {
        return Date.weekdayAndDateStampDateFormatter.string(from: self)
    }
}
