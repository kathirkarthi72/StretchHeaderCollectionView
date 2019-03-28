//
//  CustomLayout.swift
//  Collectionview
//
//  Created by Premkumar  on 27/03/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

/// Header stretch flow layout
class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect) // get layout attributes for element
        
        layoutAttributes?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader { // Find header view in section
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y // content offset
                if contentOffsetY > 0 { return } // controll stretching collectionview
                
                let width = collectionView.frame.width
                let height = attribute.frame.height - contentOffsetY
                
                attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

