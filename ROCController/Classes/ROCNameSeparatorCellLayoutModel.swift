//
//  ROCNameSeparatorCellLayoutModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/28/17.
//
//

import UIKit
import Chatto
import ChattoAdditions

open class ROCNameSeparatorCellLayoutModel {
    let layoutContext: LayoutContext
    var textFrame: CGRect = CGRect.zero
    var size: CGSize = CGSize.zero
    
    init(layoutContext: LayoutContext){
        self.layoutContext = layoutContext
    }
    
    struct LayoutContext: Equatable, Hashable {
        let text: String
        let font: UIFont
        let textInsets: UIEdgeInsets
        let isIncoming: Bool
        let preferredMaxLayoutWidth: CGFloat
        
        var hashValue: Int {
            return combineAndMakeHash(hashes: [self.text.hashValue, self.textInsets.bma_hashValue, self.preferredMaxLayoutWidth.hashValue, self.font.hashValue])
        }
        
        static func == (lhs: ROCNameSeparatorCellLayoutModel.LayoutContext, rhs: ROCNameSeparatorCellLayoutModel.LayoutContext) -> Bool {
            let lhsValues = (lhs.text, lhs.textInsets, lhs.font, lhs.preferredMaxLayoutWidth)
            let rhsValues = (rhs.text, rhs.textInsets, rhs.font, rhs.preferredMaxLayoutWidth)
            return lhsValues == rhsValues
        }
    }
    
    
    func calculateLayout() {
        let textHorizontalInset = self.layoutContext.textInsets.bma_horziontalInset
        let maxTextWidth = self.layoutContext.preferredMaxLayoutWidth - textHorizontalInset
        let textSize = self.textSizeThatFitsWidth(maxTextWidth)
        let bubbleSize = textSize.bma_outsetBy(dx: textHorizontalInset, dy: self.layoutContext.textInsets.bma_verticalInset)
        self.textFrame = CGRect(origin: CGPoint.zero, size: bubbleSize)
        self.size = bubbleSize
    }
    
    private func textSizeThatFitsWidth(_ width: CGFloat) -> CGSize {
        let textContainer: NSTextContainer = {
            let size = CGSize(width: width, height: .greatestFiniteMagnitude)
            let container = NSTextContainer(size: size)
            container.lineFragmentPadding = 0
            return container
        }()
        
        let textStorage = self.replicateUITextViewNSTextStorage()
        let layoutManager: NSLayoutManager = {
            let layoutManager = NSLayoutManager()
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
            return layoutManager
        }()
        
        let rect = layoutManager.usedRect(for: textContainer)
        return rect.size.bma_round()
    }
    
    private func replicateUITextViewNSTextStorage() -> NSTextStorage {
        // See https://github.com/badoo/Chatto/issues/129
        return NSTextStorage(string: self.layoutContext.text, attributes: [
            NSFontAttributeName: self.layoutContext.font,
            "NSOriginalFont": self.layoutContext.font
            ])
    }

}
