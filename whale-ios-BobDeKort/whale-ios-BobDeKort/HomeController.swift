//
//  ViewController.swift
//  whale-ios-BobDeKort
//
//  Created by Bob De Kort on 3/20/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let homeCell = "homeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        collectionView?.backgroundColor = .white
        collectionView?.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: homeCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCell, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
}
