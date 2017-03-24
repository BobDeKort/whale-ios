//
//  HomeCollectionViewCell.swift
//  whale-ios-BobDeKort
//
//  Created by Bob De Kort on 3/22/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    let questionLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
