//
//  UserDefaults+Extensions.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/15/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var realmURL: String? {
        get {
            return self.string(forKey: "realmURL")
        }set(val) {
            self.set(val, forKey: "realmURL")
        }
    }
    
    var cachedUsername: String? {
        get {
            return self.string(forKey: "cachedUsername")
        } set(val) {
            self.set(val, forKey: "cachedUsername")
        }
    }
    
}
