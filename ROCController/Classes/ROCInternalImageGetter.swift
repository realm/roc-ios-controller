//
//  ROCInternalImageGetter.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/21/17.
//
//

import UIKit

class ROCInternalImageGetter {
    
    class func loadImage(name: String) -> UIImage? {
        let podBundle = Bundle(for: ROCInternalImageGetter.self)
        return UIImage(named: name, in: podBundle, compatibleWith: nil)
    }
    
}
