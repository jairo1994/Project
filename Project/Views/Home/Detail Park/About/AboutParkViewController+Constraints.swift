//
//  AboutParkViewController+Constraints.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension AboutParkViewController{
    func addMyViews(){
        
        scrollView.addSubview(informationTextView)
        informationTextView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(mapView)
        mapView.isUserInteractionEnabled = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(labelAddress)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(included)
        included.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(recomendations)
        recomendations.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(includedTextView)
        includedTextView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        informationTextView.topAnchor.constraint(equalTo: topImage.bottomAnchor).isActive = true
        informationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        informationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        mapView.topAnchor.constraint(equalTo: informationTextView.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        labelAddress.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        labelAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelAddress.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        included.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 16).isActive = true
        included.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        included.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        recomendations.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 16).isActive = true
        recomendations.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        recomendations.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        includedTextView.topAnchor.constraint(equalTo: included.bottomAnchor, constant: 24).isActive = true
        includedTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        includedTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Womble the first component is the alpha not the last one. So#ff00ff00 has alpha 1 because of the ff at the beginning."
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: includedTextView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}

