//
//  HeaderCell.swift
//  StretchHeaderCollectionView
//
//  Created by Premkumar  on 28/03/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

/// Header View
class HeaderCell: UICollectionReusableView {
    
    /// ImageView
    var imageView: UIImageView = {
        let imageV = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
        imageV.contentMode = .scaleAspectFill
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    /// Property animator
    var animator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        setupVisualEffectBlur()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Setup
    fileprivate func setup() {
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    /// Setup visual effect blur with view property animator
    fileprivate func setupVisualEffectBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let effect = UIBlurEffect(style: .regular)
            let blurEffect = UIVisualEffectView(effect: effect)
            
            self?.addSubview(blurEffect)
            blurEffect.fillSuperview()
        })
        
    }
}
