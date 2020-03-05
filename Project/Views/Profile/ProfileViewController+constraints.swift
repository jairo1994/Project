//
//  ProfileViewController+constraints.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController{
    func addMyViews(){
        self.scrollView.addSubview(avatarImage)
        avatarImage.image = UIImage(named: "man")
        // avatarImage.image = UIImage(named: "woman")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImage.centerYAnchor.constraint(equalTo: topImage.topAnchor, constant: 32).isActive = true
        avatarImage.widthAnchor.constraint(equalTo: topImage.heightAnchor, multiplier: 0.7).isActive = true
        avatarImage.heightAnchor.constraint(equalTo: topImage.heightAnchor, multiplier: 0.7).isActive = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }
}
