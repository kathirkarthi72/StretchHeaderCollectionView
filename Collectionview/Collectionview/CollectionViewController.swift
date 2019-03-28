//
//  ViewController.swift
//  Collectionview
//
//  Created by Premkumar  on 22/03/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

/// Stretchable CollectionView header
class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    /// Item cell identifier
    fileprivate var itemCell = "itemCell"
    
    /// Headerview identifier
    fileprivate var header = "headerView"
    
    /// layout padding
    fileprivate let padding: CGFloat = 16

    
    /// Collectionview reusable view for headerView
    var headerCell: HeaderCell?
    
    /// Collectionviewlayout setup
    fileprivate func collectionViewSetupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 16
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    /// Collectionview setup
    fileprivate func collectionViewSetup() {
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: itemCell)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetupLayout()
        collectionViewSetup()
    }
}

// MARK: - Collectionview data source and delegates
extension CollectionViewController {
    
    // MARK: Setup Header view
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 340)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header, for: indexPath) as? HeaderCell
        
        headerCell!.backgroundColor = UIColor.init(white: 0.8, alpha: 1.0)
        return headerCell!
    }
    
    // MARK: Setup CollectionView item
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 2 * padding, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCell, for: indexPath)
        return cell
    }
}

// MARK: - Scrollview delegates
extension CollectionViewController {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
        
        if contentOffsetY > 0 { return } // controll to stop animating while headerview is scrolled on top
        
        headerCell!.animator.fractionComplete = abs(contentOffsetY / 100)
    }
}
