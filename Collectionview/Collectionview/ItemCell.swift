//
//  ItemCell.swift
//  StretchHeaderCollectionView
//
//  Created by Premkumar  on 28/03/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

/// Item cell
class ItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Setup
    func setup() {
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.init(white: 0.8, alpha: 1.0).cgColor
    }
}
