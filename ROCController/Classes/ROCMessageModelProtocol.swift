//
//  ROCMessageModelProtocol.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions


public protocol ROCMessageModelProtocol: MessageModelProtocol {
    var status: MessageStatus { get set }
}
