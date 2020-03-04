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
        
        
        self.addMyConstraints()
        self.view.layoutIfNeeded()
        self.view.setNeedsUpdateConstraints()
    }
    
    func addMyConstraints(){
        informationTextView.topAnchor.constraint(equalTo: topImage.bottomAnchor).isActive = true
        informationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        informationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        mapView.topAnchor.constraint(equalTo: informationTextView.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Womble the first component is the alpha not the last one. So#ff00ff00 has alpha 1 because of the ff at the beginning."
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
