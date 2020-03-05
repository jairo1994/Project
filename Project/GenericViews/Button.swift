//
//  Button.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class Button {
    static func normalButton() -> UIButton{
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = GeneralService.primaryColor
        btn.tintColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        btn.layer.cornerRadius = 16
        return btn
    }
    
    static func borderButton() -> UIButton{
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.borderWidth = 2
        btn.layer.borderColor = GeneralService.primaryColor.cgColor
        btn.tintColor = GeneralService.primaryColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        btn.layer.cornerRadius = 16
        return btn
    }
}
