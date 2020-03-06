//
//  SubMenuCustomCollectionViewCell.swift
//  TableViewScroll
//
//  Created by Felix Omar Huchin Rodriguez on 10/05/18.
//  Copyright © 2018 Palace Resorts. All rights reserved.
//

import UIKit

class GenericCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        imageContainer.layer.cornerRadius = 10
        imageContainer.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) { //Your code should go here.
        super.draw(rect)
        self.backgroundColor = .white
        self.contentView.backgroundColor = .white
        image.layer.cornerRadius = (self.contentView.frame.width * 0.6) / 2
    }
}
