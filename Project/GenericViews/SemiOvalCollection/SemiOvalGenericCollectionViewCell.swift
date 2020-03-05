//
//  SubMenuCustomCollectionViewCell.swift
//  TableViewScroll
//
//  Created by Felix Omar Huchin Rodriguez on 10/05/18.
//  Copyright © 2018 Palace Resorts. All rights reserved.
//

import UIKit

class SemiOvalGenericCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageContainer.layer.cornerRadius = 12
        self.imageContainer.layer.masksToBounds = false
        imageContainer.layer.cornerRadius = 10
        imageContainer.layer.masksToBounds = true

        label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        label.layer.masksToBounds = false
    }
    
}
