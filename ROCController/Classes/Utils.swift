//
//  Utils.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/28/17.
//
//

import Foundation

@inline(__always)
public func combineAndMakeHash(hashes: [Int]) -> Int {
    return hashes.reduce(0, { 31 &* $0 &+ $1.hashValue })
}
