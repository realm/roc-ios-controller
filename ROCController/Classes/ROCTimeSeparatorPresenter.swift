//
//  ROCROCTimeSeparatorPresenter.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import Foundation
import UIKit
import Chatto

open class ROCTimeSeparatorPresenter: ChatItemPresenterProtocol {
    
    let model: ROCTimeSeparatorModel
    init (model: ROCTimeSeparatorModel) {
        self.model = model
    }
    
    private static let cellReuseIdentifier = ROCTimeSeparatorCollectionViewCell.self.description()
    
    public static func registerCells(_ collectionView: UICollectionView) {
        collectionView.register(ROCTimeSeparatorCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    public func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: ROCTimeSeparatorPresenter.cellReuseIdentifier, for: indexPath)
    }
    
    public func configureCell(_ cell: UICollectionViewCell, decorationAttributes: ChatItemDecorationAttributesProtocol?) {
        guard let ROCTimeSeparatorCell = cell as? ROCTimeSeparatorCollectionViewCell else {
            assert(false, "expecting status cell")
            return
        }
        
        ROCTimeSeparatorCell.text = self.model.date
    }
    
    open var canCalculateHeightInBackground: Bool {
        return true
    }
    
    open func heightForCell(maximumWidth width: CGFloat, decorationAttributes: ChatItemDecorationAttributesProtocol?) -> CGFloat {
        return 24
    }
}
