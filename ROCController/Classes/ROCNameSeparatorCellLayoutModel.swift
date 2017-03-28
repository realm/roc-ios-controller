//
//  ROCNameSeparatorCellLayoutModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/28/17.
//
//

import UIKit
import Chatto

open class ROCNameSeparatorCellLayoutModel {
    let layoutContext: LayoutContext
    
    init(layoutContext: LayoutContext){
        self.layoutContext = layoutContext
    }
    
    struct LayoutContext: Equatable, Hashable {
        let text: String
        let font: UIFont
        let textInsets: UIEdgeInsets
        let preferredMaxLayoutWidth: CGFloat
        
        var hashValue: Int {
            var hashes = [Int]()
            
            return hashes.reduce(0, { 31 &* $0 &+ $1.hashValue })
        }
        
        static func == (lhs: ROCNameSeparatorCellLayoutModel.LayoutContext, rhs: ROCNameSeparatorCellLayoutModel.LayoutContext) -> Bool {
            let lhsValues = (lhs.text, lhs.textInsets, lhs.font, lhs.preferredMaxLayoutWidth)
            let rhsValues = (rhs.text, rhs.textInsets, rhs.font, rhs.preferredMaxLayoutWidth)
            return lhsValues == rhsValues
        }
        
    }
}
