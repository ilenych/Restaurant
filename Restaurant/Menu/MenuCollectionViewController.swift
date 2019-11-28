//
//  MenuCollectionViewController.swift
//  Restaurant
//
//  Created by  SENAT on 28.11.2019.
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuCollectionViewController: UICollectionViewController {
    
    var itemMenuArray: [Menu] = {
        var menu = Menu()
        menu.imageString = "menu2"
        
        var menu2 = Menu()
        menu2.imageString = "email"
        return [menu, menu2]
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
    
        cell.menu = itemMenuArray[indexPath.row]
    
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
