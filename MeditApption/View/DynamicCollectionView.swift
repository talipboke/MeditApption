//
//  DynamicCollectionView.swift
//  MeditApption
//
//  Created by Talip Böke on 17.03.2021.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    
    private var lastContentHeight: CGFloat = 0
    internal var didContentSizeChanged: ((CGFloat) -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        if lastContentHeight != collectionViewLayout.collectionViewContentSize.height {
            lastContentHeight = collectionViewLayout.collectionViewContentSize.height
            didContentSizeChanged?(lastContentHeight)
        }
        return collectionViewLayout.collectionViewContentSize
    }
}
