//
//  MenuCollectionViewCell.swift
//  Restaurant
//
//  Created by  SENAT on 28.11.2019.
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuImageView: UIImageView!
    
    var menu: Menu? {
        didSet {
            if let image = menu?.imageString {
            menuImageView.image = UIImage(named: image)
            }
        }
    }
}
