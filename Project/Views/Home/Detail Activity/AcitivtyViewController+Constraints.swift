//
//  AcitivtyViewController+Constraints.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension ActivityViewController{
    func addMyViews(){
        scrollView.addSubview(informationTextView)
        informationTextView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(includedLabel)
        includedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(btnMap)
        btnMap.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(btnLike)
        btnLike.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scheduleInfo)
        scheduleInfo.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addMyConstraints()
        self.view.layoutIfNeeded()
        self.view.setNeedsUpdateConstraints()
    }
    
    func addMyConstraints(){
        informationTextView.topAnchor.constraint(equalTo: topImage.bottomAnchor).isActive = true
        informationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        informationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        includedLabel.topAnchor.constraint(equalTo: informationTextView.bottomAnchor).isActive = true
        includedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        includedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 80).isActive = true
        
        btnLike.centerYAnchor.constraint(equalTo: includedLabel.centerYAnchor).isActive = true
        btnLike.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        btnLike.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnLike.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        btnMap.centerYAnchor.constraint(equalTo: btnLike.centerYAnchor).isActive = true
        btnMap.trailingAnchor.constraint(equalTo: btnLike.leadingAnchor, constant: -8).isActive = true
        btnMap.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnMap.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        scheduleInfo.topAnchor.constraint(equalTo: includedLabel.bottomAnchor, constant: 16).isActive = true
        scheduleInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: scheduleInfo.bottomAnchor, constant: 16).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4).isActive = true
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Womble the first component is the alpha not the last one. So#ff00ff00 has alpha 1 because of the ff at the beginning."
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
