//
//  ProfileOptionsTableViewCell.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class ProfileOptionsTableViewCell: UITableViewCell {
    @IBOutlet weak var icon: UIButton!
    @IBOutlet weak var informationOption: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        informationOption.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 0)
        informationOption.isUserInteractionEnabled = false
        // Configure the view for the selected state
    }
    
    func configureCell(option: ProfileOptionModel, index: Int){
        self.icon.setImage(option.image, for: .normal)
        let attrString = NSMutableAttributedString()
        
        if (index+1)%2 == 0{
            self.icon.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else{
            self.icon.tintColor = GeneralService.primaryColor
        }
        
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), ofSize: UIFont.boldSystemFont(ofSize: 17), text: option.titleLabel)
        attrString.appendWith(color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\(option.description!)")
        self.informationOption.attributedText = attrString
    }
    
}
