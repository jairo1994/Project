//
//  ParckCollectionViewCell.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class ParckCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagePark: UIImageView!
    @IBOutlet weak var namePark: UILabel!
    @IBOutlet weak var descPark: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) { //Your code should go here.
        super.draw(rect)
        imagePark.layer.cornerRadius = (self.imagePark.frame.width * 0.6) / 2
        backView.layer.cornerRadius = (self.imagePark.frame.width * 0.6) / 2
    }

}
